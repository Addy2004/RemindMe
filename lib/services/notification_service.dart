import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:remind_me/main.dart';
import 'package:flutter/material.dart';

class NotificationService{

  static void cancelNotification({required int channelID}){
    notificationsPlugin.cancel(channelID);
  }

  static void showNotifications(
  {
   required int channelID,
   required String notificationTitle,
   required DateTime dateTime
  }
      ) async {
   AndroidNotificationDetails androidNotificationDetails
   = const AndroidNotificationDetails(
       "channel_id", "channel_name",
       enableVibration: true,
       enableLights: true,
       channelShowBadge: true,
       colorized: true,
       color: Colors.pink,
       fullScreenIntent: true,
       importance: Importance.max,
       priority: Priority.max

   );
   NotificationDetails notificationDetails
   = NotificationDetails(
       android: androidNotificationDetails
   );
   await notificationsPlugin.schedule(
       channelID,
       "Remind Me",
       notificationTitle,
       dateTime,
       notificationDetails,
      androidAllowWhileIdle: true,
       payload: "payload"
   );
  }

 }