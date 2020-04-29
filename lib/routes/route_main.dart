
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/Reminder.dart';
import 'package:flutter_training/routes/route_create_reminder.dart';
import 'package:flutter_training/widgets/widget_reminder_list.dart';

class MainRoute extends StatefulWidget {

  MainRoute({Key key}) : super(key: key);

  @override
  _MainRouteState createState() => _MainRouteState();

}

class _MainRouteState extends State<MainRoute> {

  List<Reminder> reminders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders"),
      ),
      body: DefaultReminderList(
        reminders: this.reminders,
        onItemClicked: _editReminder,
        onItemDismissed: _dismissReminder,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createReminder,
        child: Icon(Icons.add),
      ),
    );
  }

  void _createReminder() {
    _makeReminder().then(_addReminder);
  }

  void _editReminder(ReminderItem item) {
    _updateReminder(item).then(_replaceReminder);
  }

  void _dismissReminder(int index) => setState(() {
    reminders.removeAt(index);
  });

  Future<Reminder> _makeReminder() {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute()));
  }

  void _addReminder(Reminder reminder) => setState(() {
    if (reminder != null) {
      setState(() { reminders.add(reminder); });
    }
  });

  Future<ReminderItem> _updateReminder(ReminderItem item) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute(edited: item)));
  }

  void _replaceReminder(ReminderItem item) => setState(() {
    if (item != null) {
      reminders.removeAt(item.index);
      reminders.insert(item.index, item.reminder);
    }
  });

}
