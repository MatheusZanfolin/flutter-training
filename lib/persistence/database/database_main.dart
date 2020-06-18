
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

  void createReminder(Reminder reminder, InsertCallback onReminderSaved) {
    insert(reminder, ReminderSerializer(), ReminderTable(), onReminderSaved);
  }

  void updateReminder(Reminder reminder, UpdateCallback onReminderUpdated) {
    update(reminder, ReminderSerializer(), ReminderTable(), reminder.id, onReminderUpdated);
  }

  void deleteReminder(Reminder reminder, DeleteCallback onReminderDeleted) {
    delete(reminder.id, ReminderTable(), onReminderDeleted);
  }

  void getReminders(GetCallback<Reminder> onRemindersAcquired) {
    get(ReminderTable(), ReminderDeserializer(), onRemindersAcquired);
  }

}