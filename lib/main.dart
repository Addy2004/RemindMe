import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

//To disable GlowingOverscrollIndicator
class NoGlowEffect extends MaterialScrollBehavior{
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details){
    return child;
  }
}

//hey there!a

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent),);
    return MaterialApp(
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
    );
  }
}
