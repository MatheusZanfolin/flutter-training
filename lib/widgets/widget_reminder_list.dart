
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/Reminder.dart';
import 'package:flutter_training/widgets/widget_reminder_list_item.dart';

class DefaultReminderList extends StatelessWidget {

  final List<Reminder> reminders;

  DefaultReminderList({Key key, @required this.reminders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: reminders.length,

      separatorBuilder: (context, index) => Divider(color: Colors.grey),

      itemBuilder: (context, index) => DefaultReminderItem(reminders[index]),
    );
  }

}