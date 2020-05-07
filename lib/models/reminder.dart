
class Reminder {

  String title;
  String description;

  Reminder(this.title, this.description);

}

class EditableReminder {

  final Reminder reminder;
  final int index;

  EditableReminder(this.reminder, this.index);

}