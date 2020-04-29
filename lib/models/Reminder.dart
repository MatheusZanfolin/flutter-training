
class Reminder {

  String title;
  String description;

  Reminder(this.title, this.description);

}

class ReminderItem {

  final Reminder reminder;
  final int index;

  ReminderItem(this.reminder, this.index);

}