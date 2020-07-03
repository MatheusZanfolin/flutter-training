
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

  Future<D> performAtDatabase<D>(DatabaseCallback<D> onDatabaseOpened) {
    return _open(createDatabase()).then(onDatabaseOpened);
  }

  @protected
  Future<int> insert<D>(D data, Serializer<D> serializer, Table table) =>
    performAtDatabase((db) =>
      db.insert(
        table.getName(),
        serializer.serialize(data),
        conflictAlgorithm: ConflictAlgorithm.replace
      )
    );

  @protected
  Future<List<D>> get<D>(Table table, Deserializer<D> deserializer) =>
    performAtDatabase((db) =>
      db.query(
        table.getName()
      ).then((result) =>
        Future.value(List.generate(result.length, (i) => deserializer.deserialize(result[i])))
      )
    );

  @protected
  Future<int> update<D>(D data, Serializer serializer, Table table, int id) =>
    performAtDatabase((db) =>
      db.update(
        table.getName(),
        serializer.serialize(data),
        where: 'id = ?',
        whereArgs: [id]
      )
    );

  @protected
  Future<int> delete(int id, Table table) =>
    performAtDatabase((db) =>
      db.delete(
        table.getName(),
        where: 'id = ?',
        whereArgs: [id]
      )
    );

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

typedef DatabaseCallback<D> = Future<D> Function(Database);