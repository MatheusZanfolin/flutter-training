
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/Reminder.dart';
import 'package:flutter_training/widgets/widget_mandatory_input.dart';

class CreateReminderRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create new reminder"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: CreateReminderForm(),
        )
    );
  }

}

class CreateReminderForm extends StatelessWidget {

  final _reminderForm = GlobalKey<FormState>();

  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _reminderForm,
      child: Column(
        children: [
          MandatoryInput(title, "Title"),
          MandatoryInput(description, "Description"),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () { _createReminder(context); },
                      child: Text("Create reminder",
                        style: TextStyle(color: Colors.white)
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _createReminder(BuildContext context) {
    if (_isValidInput()) {
      _submitReminder(context);
    }
  }

  bool _isValidInput() {
    return _reminderForm.currentState.validate();
  }

  void _submitReminder(BuildContext context) {
    Navigator.of(context).pop(Reminder(title.text, description.text));
  }

}