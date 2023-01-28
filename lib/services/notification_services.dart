// ignore_for_file: prefer_const_constructors

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifyHelper {
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = new AndroidInitializationSettings('icon');
    var initializationsSettings = new InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings) ;
  }


  void sendNotification({var id =0 ,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln
  }) async{
    AndroidNotificationDetails androidPlatformChannelSpecifics=
    AndroidNotificationDetails("channelID", "channelName",
        playSound: true,
        // sound: RawResourceAndroidNotificationSound('notification'),
        importance: Importance.max,
        priority: Priority.high);

    var not= NotificationDetails(
        android: androidPlatformChannelSpecifics);
    await fln.show(
      0,
      title,
      body,
      not,
    );
  }
}






// class NotifyHelper {
//   FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin(); //
//
//   void initializeNotification() async {
//     final AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('icon');
//
//     {
//       InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid,
//       );
//       await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//     }

// void sendNotification(String title, String body) async {
//   AndroidNotificationDetails("channelID", "channelName",
//       importance: Importance.max, priority: Priority.high);
//   NotificationDetails notificationDetails = NotificationDetails();
//
//   _flutterLocalNotificationsPlugin.show(
//     0,
//     title,
//     body,
//     notificationDetails,
//   );
// }
//   }
// }

//   Future selectNotification(String payload) async {
//     // ignore: unnecessary_null_comparison
//     if (payload != null) {
//       //selectedNotificationPayload = "The best";
//       //selectNotificationSubject.add(payload);
//       print('notification payload: $payload');
//     } else {
//       print("Notification Done");
//     }
//
//     if(payload=="Theme Changed"){
//       //going nowhere
//     }else{
//       Get.to(()=>Container(color: Colors.white,));
//     }
//   }
// }
//
// displayNotification({required String title, required String body}) async {
//   print("doing test");
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       importance: Importance.max, priority: Priority.high);
//   var platformChannelSpecifics = new NotificationDetails(
//       android: androidPlatformChannelSpecifics);
//   await  FlutterLocalNotificationsPlugin.show(
//     0,
//     'You change your theme',
//     'You changed your theme back !',
//     platformChannelSpecifics,
//     payload: 'It could be anything you pass',
//   );
