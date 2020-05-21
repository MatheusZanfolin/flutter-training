
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MandatoryInput extends StatelessWidget {

  final _label;
  final _controller;
  String text;

  MandatoryInput(this._controller, this._label, { this.text });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validateMandatory,
      controller: _controller,
      decoration: InputDecoration(
          labelText: _label
      ),
    );
  }

  String _validateMandatory(value) { return value.isEmpty ? "Obrigatório" : null; }

}