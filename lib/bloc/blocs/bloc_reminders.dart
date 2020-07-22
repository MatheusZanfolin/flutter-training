
import 'package:flutter_training/bloc/bloc.dart';
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/persistence/database/database_main.dart';

class RemindersBloc extends BLoC<List<Reminder>> {

  final _repository = ReminderRepository();

  void create(Reminder reminder) {
    if (reminder != null) {
      _repository.createReminder(reminder);
    }
  }

  void update(Reminder reminder) {
    if (reminder != null) {
      _repository.updateReminder(reminder);
    }
  }

  void delete(Reminder reminder) {
    if (reminder != null) {
      _repository.deleteReminder(reminder);
    }
  }

  void _refreshReminders() => _repository.getReminders().then(sink.add);

}