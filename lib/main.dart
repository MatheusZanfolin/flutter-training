
import 'package:flutter/material.dart';
import 'package:flutter_training/bloc/bloc.dart';
import 'package:flutter_training/bloc/blocs/bloc_reminders.dart';
import 'package:flutter_training/routes/route_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider<RemindersBloc>(
    bloc: RemindersBloc(),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainRoute(),
    ),
  );
}
