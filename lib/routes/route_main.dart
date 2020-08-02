
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/bloc/blocs/bloc_reminders.dart';
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/routes/route_create_reminder.dart';
import 'package:flutter_training/widgets/widget_async_builder.dart';
import 'package:flutter_training/widgets/widget_error_icon.dart';
import 'package:flutter_training/widgets/widget_loading_icon.dart';
import 'package:flutter_training/widgets/widget_reminder_list.dart';

class MainRoute extends StatefulWidget {

  MainRoute({Key key}) : super(key: key);

  @override
  _MainRouteState createState() => _MainRouteState();

}

class _MainRouteState extends State<MainRoute> {

  final reminders = RemindersBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reminders")),
      body: StreamBuilder(
        stream: reminders.stream,
        builder: (context, snapshot) => AsyncBuilder(
          data: snapshot,
          onDataAbsent: reminders.refresh,
          loadingIcon: LoadingIcon(),
          errorIcon: ErrorIcon(),
          child: DefaultReminderList(snapshot.data, _onEditReminder, _onDismissReminder),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createReminder,
        child: Icon(Icons.add),
      ),
    );
  }

  void _createReminder() {
    _makeReminder().then((reminder) => setState(() { reminders.create(reminder); }));
  }

  void _onEditReminder(item) {
    _updateReminder(item).then((reminder) => setState(() { reminders.update(reminder); }));
  }

  void _onDismissReminder(reminder) {
    setState(() { reminders.delete(reminder); });
  }

  Future<Reminder> _makeReminder() {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute()));
  }

  Future<Reminder> _updateReminder(Reminder item) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateReminderRoute(edited: item)));
  }

  @override
  void dispose() {
    reminders.dispose();
    super.dispose();
  }

}