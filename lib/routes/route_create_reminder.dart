
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/Reminder.dart';
import 'package:flutter_training/widgets/widget_mandatory_input.dart';

final int _NOT_EDITING = -1;

class CreateReminderRoute extends StatelessWidget {

  final ReminderItem edited;

  const CreateReminderRoute({Key key, this.edited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create new reminder"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: CreateReminderForm(edited),
        )
    );
  }

}

class CreateReminderForm extends StatelessWidget {

  final _reminderForm = GlobalKey<FormState>();

  final title = TextEditingController();
  final description = TextEditingController();

  int index = _NOT_EDITING;

  CreateReminderForm(ReminderItem item) {
    if (item != null) {
      this.title.text = item.reminder.title;
      this.description.text = item.reminder.description;

      this.index = item.index;
    }
  }

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
    if (index == _NOT_EDITING) {
      submitNewReminder(context);
    } else {
      submitEditedReminder(context);
    }
  }

  void submitNewReminder(BuildContext context) {
    Navigator.of(context).pop(getReminder());
  }

  void submitEditedReminder(BuildContext context) {
    Navigator.of(context).pop(ReminderItem(getReminder(), index));
  }

  Reminder getReminder() => Reminder(title.text, description.text);

}