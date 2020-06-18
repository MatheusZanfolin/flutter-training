
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class Serializer<T> {

  Map<String, Object> serialize(T serializable);

}

abstract class Deserializer<T> {

  T deserialize(Map<String, Object> mapped);

}

abstract class LocalDatabase {

  String getFile();

  int getVersion();

  List<Table> getTables();

}

abstract class Table {

  String getName();

  String create();

}

abstract class LocalRepository {

  LocalDatabase createDatabase();

  void performAtDatabase(DatabaseCallback onDatabaseOpened) {
    _open(createDatabase()).then(onDatabaseOpened);
  }

  @protected
  void insert<D>(D data, Serializer<D> serializer, Table table, InsertCallback onRowInserted) {
    performAtDatabase((db) {
      db.insert(
          table.getName(),
          serializer.serialize(data),
          conflictAlgorithm: ConflictAlgorithm.replace
      ).then(
          onRowInserted
      );
    });
  }

  @protected
  void get(Table table, Deserializer deserializer, GetCallback onRowsAcquired) {
    performAtDatabase((db) {
      db.query(
          table.getName()
      ).then((result) => onRowsAcquired(
          List.generate(result.length, (i) => deserializer.deserialize(result[i])))
      );
    });
  }

  @protected
  void update<D>(D data, Serializer serializer, Table table, int id, UpdateCallback onRowsUpdated) {
    performAtDatabase((db) {
      db.update(
          table.getName(),
          serializer.serialize(data),
          where: 'id = ?',
          whereArgs: [id]
      ).then(
          onRowsUpdated
      );
    });
  }

  @protected
  void delete(int id, Table table, DeleteCallback onRowsDeleted) {
    performAtDatabase((db) {
      db.delete(
          table.getName(),
          where: 'id = ?',
          whereArgs: [id]
      ).then(
          onRowsDeleted
      );
    });
  }

  Future<Database> _open(LocalDatabase database) async => openDatabase(
      join(await getDatabasesPath(), database.getFile()),

      version: database.getVersion(),

      onCreate: (db, version) => _create(db, database.getTables())
  );

  void _create(Database db, List<Table> tables) {
    var query = StringBuffer();

    tables.forEach((table) { query.write(table.create()); });

    db.execute(query.toString());
  }

}

typedef DatabaseCallback = void Function(Database);

typedef InsertCallback = void Function(int newId);

typedef GetCallback<T> = void Function(List<T>);

typedef DeleteCallback = void Function(int affectedRows);

typedef UpdateCallback = void Function(int affectedRows);