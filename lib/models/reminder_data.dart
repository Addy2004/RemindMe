import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'reminder.dart';

class ReminderData extends ChangeNotifier{
  final List<Reminder> _reminders = [
    Reminder(title: 'wake up', dateTime: DateTime(2023, 1, 28, 5, 0))
  ];

  UnmodifiableListView<Reminder> get reminders => UnmodifiableListView(_reminders);

  int get reminderCount => _reminders.length;

  void add(Reminder reminder){
    _reminders.add(reminder);
    notifyListeners();
  }

  void toggleControl(Reminder reminder){
    reminder.toggleSwitch();
    notifyListeners();
  }
}