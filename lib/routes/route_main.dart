
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

  void _dismissReminder(int index) => setState(() {
    reminders.removeAt(index);
  });

  void _createReminder() {
    _makeReminder().then(_addReminder);
  }

  void _editReminder(EditableReminder item) {
    _updateReminder(item).then(_replaceReminder);
  }

  Future<Reminder> _makeReminder() {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute()));
  }

  Future<EditableReminder> _updateReminder(EditableReminder item) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute(edited: item)));
  }

  void _addReminder(Reminder reminder) => setState(() {
    if (reminder != null) {
      setState(() { reminders.add(reminder); });
    }
  });

  void _replaceReminder(EditableReminder item) => setState(() {
    if (item != null) {
      reminders.removeAt(item.index);
      reminders.insert(item.index, item.reminder);
    }
  });

}
