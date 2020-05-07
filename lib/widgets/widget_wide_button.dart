
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/ButtonStyle.dart';

class WideButton extends StatelessWidget {

  final VoidCallback _onButtonPressed;
  final ButtonStyle _style;

  WideButton(this._style, this._onButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            color: _style.buttonColor,
            onPressed: _onButtonPressed,
            child: Text("Create reminder",
                style: TextStyle(color: _style.textColor)
            ),
          ),
        )
      ],
    );
  }

}