
import 'package:flutter_training/bloc/bloc.dart';
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/persistence/database/database_main.dart';

class RemindersBloc extends BLoC<List<Reminder>> {

  final _repository = ReminderRepository();

  void refresh() => _repository.getReminders().then(sink.add);

  void create(Reminder reminder) {
    if (reminder != null) {
      _perform(_repository.createReminder(reminder));
    }
  }

  void update(Reminder reminder) {
    if (reminder != null) {
      _perform(_repository.updateReminder(reminder));
    }
  }

  void delete(Reminder reminder) {
    if (reminder != null) {
      _perform(_repository.deleteReminder(reminder));
    }
  }

  void _perform(Future operation) => operation.then((result) => refresh());

}