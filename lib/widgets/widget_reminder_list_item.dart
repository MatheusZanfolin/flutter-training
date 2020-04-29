
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/Reminder.dart';

class DefaultReminderItem extends StatelessWidget {

  final Reminder _reminder;

  DefaultReminderItem(this._reminder);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ReminderTitle(_reminder.title),
      subtitle: ReminderDescription(_reminder.description),
      trailing: Icon(Icons.edit),
    );
  }

}

class ReminderTitle extends StatelessWidget {

  final String _title;

  ReminderTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(_title,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),
    );
  }

}

class ReminderDescription extends StatelessWidget {

  final String _description;

  ReminderDescription(this._description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      child: Text(_description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );

  }

}