
import 'dart:async';

import 'package:flutter_training/bloc/bloc.dart';
import 'package:flutter_training/models/reminder.dart';

class RemindersBloc implements BLoC {

  final _controller = StreamController<List<Reminder>>();

  Stream<List<Reminder>> get stream => _controller.stream;

  void setReminders(List<Reminder> reminders) {
    _controller.sink.add(reminders);
  }

  @override
  void dispose() {
    _controller.close();
  }

}