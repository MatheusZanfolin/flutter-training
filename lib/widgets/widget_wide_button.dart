
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WideButton extends StatelessWidget {

  final Color background;
  final VoidCallback onButtonPressed;
  final Widget child;

  WideButton({this.background, this.onButtonPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            color: background,
            onPressed: onButtonPressed,
            child: child,
          ),
        )
      ],
    );
  }

}