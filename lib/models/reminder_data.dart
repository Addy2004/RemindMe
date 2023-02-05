import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:remind_me/services/notification_service.dart';
import 'reminder.dart';
//Reminder Implementation with Provider Package
class ReminderData extends ChangeNotifier{
  final List<Reminder> _reminders = [];

  UnmodifiableListView<Reminder> get reminders => UnmodifiableListView(_reminders);

  int get reminderCount => _reminders.length;

  void add(Reminder reminder){
    _reminders.add(reminder);
    NotificationService.showNotifications(
        channelID: _reminders.indexOf(reminder), notificationTitle: reminder.title, dateTime: reminder.dateTime);
    notifyListeners();
  }

  void remove(Reminder reminder){
    NotificationService.cancelNotification(channelID: reminders.indexOf(reminder));
    _reminders.remove(reminder);
    notifyListeners();
  }

  void edit(Reminder reminder, int index){
    _reminders[index].title = reminder.title;
    _reminders[index].dateTime = reminder.dateTime;
    NotificationService.cancelNotification(channelID: index);
    NotificationService.showNotifications(
        channelID: _reminders.indexOf(reminder), notificationTitle: reminder.title, dateTime: reminder.dateTime);
    notifyListeners();
  }

  //TODO-Cupertino Switch (ReminderData toggle)
  void toggleControl(Reminder reminder){
    reminder.toggleSwitch();
    notifyListeners();
  }

  //TODO- create a method for silent/alarm toggle
}