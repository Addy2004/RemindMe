import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:remind_me/models/reminder_data.dart';
import 'screens/main_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  notificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

  AndroidInitializationSettings androidInitializationSettings
  =const AndroidInitializationSettings('@mipmap/ic_launcher');

  InitializationSettings initializationSettings
  = InitializationSettings(android: androidInitializationSettings);

  bool? initialized = await notificationsPlugin.initialize(initializationSettings);
  
  log("Notifications: $initialized");
  
  runApp(const MyApp());
}

//To disable GlowingOverscrollIndicator
class NoGlowEffect extends MaterialScrollBehavior{
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details){
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent),);
    return ChangeNotifierProvider(
      create: (context) => ReminderData(),
      child: MaterialApp(
        scrollBehavior: NoGlowEffect(),
        //To disable Widget Splash Effect
        theme: ThemeData(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent
        ),
        //App initializes with MainScreen()
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => const MainScreen()
        },
      ),
    );
  }
}
