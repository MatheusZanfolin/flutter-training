
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: Center(
        child: Text("Hello, world!"),
      )
    );
  }

}
