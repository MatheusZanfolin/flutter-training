
class Reminder {

  final int id;
  final String title;
  final String description;

  Reminder(this.title, this.description, [this.id]);

}

class EditableReminder {

  final Reminder reminder;
  final int index;

  EditableReminder(this.reminder, this.index);

}