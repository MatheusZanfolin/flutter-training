
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/widgets/widget_reminder_list_item.dart';

typedef void ItemClickListener(Reminder clicked);
typedef void ItemDismissListener(Reminder dismissed);

class DefaultReminderList extends StatelessWidget {

  final List<Reminder> _reminders;
  final ItemClickListener _onItemClicked;
  final ItemDismissListener _onItemDismissed;

  DefaultReminderList(this._reminders, this._onItemClicked, this._onItemDismissed);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _reminders.length,

      separatorBuilder: (context, index) => Divider(color: Colors.grey),

      itemBuilder: (context, index) => GestureDetector(
        onTap: () { _onItemClicked(_reminders[index]); },

        child: Dismissible(
          key: UniqueKey(),

          onDismissed: (direction) => _onItemDismissed(_reminders[index]),

          child: DefaultReminderItem(_reminders[index]),
        ),
      ),
    );
  }

}