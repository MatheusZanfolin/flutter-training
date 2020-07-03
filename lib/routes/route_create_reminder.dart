
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/reminder.dart';
import 'package:flutter_training/widgets/widget_mandatory_input.dart';
import 'package:flutter_training/widgets/widget_wide_button.dart';

const notEditing = -1;

class CreateReminderRoute extends StatelessWidget {

  final Reminder edited;

  const CreateReminderRoute({Key key, this.edited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create new reminder"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ReminderCreationForm(edited),
        )
    );
  }

}

class ReminderCreationForm extends StatelessWidget {

  final _reminderForm = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _description = TextEditingController();

  int _reminderId;

  ReminderCreationForm(Reminder item) {
    if (item != null) {
      this._reminderId = item.id;
      this._title.text = item.title;
      this._description.text = item.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _reminderForm,
      child: Column(
        children: [
          MandatoryInput(_title, "Title"),
          MandatoryInput(_description, "Description"),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: WideButton(
                background: Colors.blue,
                onButtonPressed: () { _createReminder(context); },
                child: Text("Create reminder",
                  style: TextStyle(color: Colors.white),
                ),
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
    Navigator.of(context).pop(getReminder());
  }

  Reminder getReminder() => Reminder(_title.text, _description.text, _reminderId);

}