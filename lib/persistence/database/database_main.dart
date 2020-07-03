
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/persistence/persistence.dart';

class ReminderSerializer implements Serializer<Reminder> {

  @override
  Map<String, Object> serialize(Reminder serializable) => {
    'id': serializable.id,
    'title': serializable.title,
    'description': serializable.description
  };

}

class ReminderDeserializer implements Deserializer<Reminder> {

  @override
  Reminder deserialize(Map<String, Object> mapped) => Reminder (
    mapped['title'],
    mapped['description'],
    mapped['id']
  );

}

class MainDatabase implements LocalDatabase {

  @override
  int getVersion() => 1;

  @override
  String getFile() => 'main_database.db';

  @override
  List<Table> getTables() => [ReminderTable()];

}

class ReminderTable implements Table {

  @override
  String getName() => 'Reminders';

  @override
  String create() => 'CREATE TABLE Reminders(id INTEGER PRIMARY KEY, title TEXT, description TEXT);';

}

class ReminderRepository extends LocalRepository {

  @override
  LocalDatabase createDatabase() => MainDatabase();

  Future<int> createReminder(Reminder reminder) {
    return insert(reminder, ReminderSerializer(), ReminderTable());
  }

  Future<int> updateReminder(Reminder reminder) {
    return update(reminder, ReminderSerializer(), ReminderTable(), reminder.id);
  }

  Future<int> deleteReminder(Reminder reminder) {
    return delete(reminder.id, ReminderTable());
  }

  Future<List<Reminder>> getReminders() {
    return get(ReminderTable(), ReminderDeserializer());
  }

}