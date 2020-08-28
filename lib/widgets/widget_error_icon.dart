
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        )
      ],
    ),
  );

}