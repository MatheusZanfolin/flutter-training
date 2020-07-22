
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/bloc/blocs/bloc_reminders.dart';
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/routes/route_create_reminder.dart';
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
      appBar: AppBar(
        title: Text("Reminders"),
      ),
      body: StreamBuilder(
        stream: reminders.stream,
        builder: _mainViewBuilder,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createReminder,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _mainViewBuilder(context, AsyncSnapshot snapshot) {
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
