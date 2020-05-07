
import 'package:flutter/material.dart';

abstract class ButtonStyle {

  MaterialColor buttonColor;
  MaterialColor textColor;

}

class CallToAction implements ButtonStyle {

  @override
  MaterialColor buttonColor = Colors.blue;

  @override
  MaterialColor textColor = Colors.white;

}