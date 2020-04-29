
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/Reminder.dart';
import 'package:flutter_training/routes/route_create_reminder.dart';

class MainRoute extends StatefulWidget {

  MainRoute({Key key}) : super(key: key);

  @override
  _MainRouteState createState() => _MainRouteState();

}

class _MainRouteState extends State<MainRoute> {

  Reminder reminder = Reminder("Title", "Description");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(reminder.title),
            Text(reminder.description)
          ],
        ),
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

  Future<Reminder> _makeReminder() {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute()));
  }

  void _addReminder(Reminder reminder) => setState(() {
    if (reminder != null) {
      setState(() { this.reminder = reminder; });
    }
  });

}
