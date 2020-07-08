
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/routes/route_create_reminder.dart';
import 'package:flutter_training/persistence/database/database_main.dart';
import 'package:flutter_training/widgets/widget_reminder_list.dart';

class MainRoute extends StatefulWidget {

  MainRoute({Key key}) : super(key: key);

  @override
  _MainRouteState createState() => _MainRouteState();

}

class _MainRouteState extends State<MainRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders"),
      ),
      body: FutureBuilder(
        future: ReminderRepository().getReminders(),
        builder: mainViewBuilder,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createReminder,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget mainViewBuilder(context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return listView(snapshot.data);
    } else if (snapshot.hasError) {
      return errorView(snapshot.error);
    } else {
      return loadingView();
    }
  }

  Widget listView(reminders) => DefaultReminderList(
    reminders, _onEditReminder, _onDismissReminder
  );

  Widget errorView(error) => SizedBox.expand(
    child: Column(
      children: <Widget>[
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    ),
  );

  Widget loadingView() => SizedBox.expand(
    child: Column(
      children: <Widget>[
        SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    ),
  );

  void _onDismissReminder(reminder) => setState(() {
    ReminderRepository().deleteReminder(reminder);
  });

  void _createReminder() {
    _makeReminder().then(_addReminder);
  }

  void _onEditReminder(item) {
    _updateReminder(item).then(_replaceReminder);
  }

  Future<Reminder> _makeReminder() {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute()));
  }

  Future<Reminder> _updateReminder(Reminder item) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute(edited: item)));
  }

  void _addReminder(reminder) => setState(() {
    if (reminder != null) {
      ReminderRepository().createReminder(reminder);
    }
  });

  void _replaceReminder(reminder) => setState(() {
    if (reminder != null) {
      ReminderRepository().updateReminder(reminder);
    }
  });

}
