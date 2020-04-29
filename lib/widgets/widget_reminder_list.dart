
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/Reminder.dart';
import 'package:flutter_training/widgets/widget_reminder_list_item.dart';

typedef void ItemDismissListener(int index);

class DefaultReminderList extends StatelessWidget {

  final List<Reminder> reminders;
  final ItemDismissListener onItemDismissed;

  DefaultReminderList({
    Key key,
    @required this.reminders,
    @required this.onItemDismissed
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: reminders.length,

      separatorBuilder: (context, index) => Divider(color: Colors.grey),

      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),

        onDismissed: (direction) => onItemDismissed(index),

        child: DefaultReminderItem(reminders[index]),
      ),
    );
  }

}