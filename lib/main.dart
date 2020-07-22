
import 'package:flutter/material.dart';
import 'package:flutter_training/routes/route_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MainRoute(),
  );
}
