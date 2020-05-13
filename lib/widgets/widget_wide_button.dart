
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/contracts/button_style.dart';

class WideButton extends StatelessWidget {

  final String text;
  final VoidCallback onButtonPressed;
  final ButtonStyle style;

  WideButton({this.text, this.style, this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            color: style.buttonColor,
            onPressed: onButtonPressed,
            child: Text(text,
                style: TextStyle(color: style.textColor)
            ),
          ),
        )
      ],
    );
  }

}