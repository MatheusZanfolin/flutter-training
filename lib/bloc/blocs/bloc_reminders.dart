
import 'dart:async';

import 'package:flutter_training/bloc/bloc.dart';
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/persistence/database/database_main.dart';

class RemindersBloc extends BLoC<List<Reminder>> {

  final repository = ReminderRepository();

  void getReminders() => repository.getReminders().then(sink.add);

}