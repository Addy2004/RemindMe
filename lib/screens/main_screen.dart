import 'package:flutter/material.dart';
import 'package:remind_me/constants.dart';
import 'package:remind_me/screens/home_screen.dart';
import 'settings_screen.dart';
import 'menu_screen.dart';
import 'package:remind_me/widgets/switch_icon.dart';
import 'package:remind_me/widgets/curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String id = 'main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pageController = PageController(
      //starts PageView() with HomeScreen()
      initialPage: 1);
  int currentIndex = 1; //records current page index
  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarIconsList = <Widget> [

//Menu Icon
SwitchIcon(switchIconColorCondition: 0 == currentIndex, icon: Icons.menu),
//Home Icon
SwitchIcon(switchIconColorCondition: 1 == currentIndex, icon: Icons.home),
//Settings Icon
SwitchIcon(switchIconColorCondition: 2 == currentIndex, icon: Icons.settings)

    ];
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: kMainScreenBackgroundColor,
        body: PageView(
          controller: pageController,
          onPageChanged: (newIndex){
              //updates page index
            setState((){
              //updates current index when page is changed via swiping
              currentIndex = newIndex;
            });

          },
          children:  [MenuScreen(), HomeScreen(), SettingsScreen()],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.easeInQuart,
          animationDuration: const Duration(
              milliseconds: kCurvedNavigationBarAnimationDuration),
          onTap: (newIndex) {
            setState((){
              //updates current index when page is changes via navigation bar
              currentIndex = newIndex;
            });
            //controls animation to pages
            pageController.animateToPage(
                newIndex,
                duration: const Duration(
                    milliseconds: kPageSwipeAnimationDuration),
                curve: Curves.easeInQuart);
          },
          color: kCurvedNavigationBarForegroundColor,
          buttonBackgroundColor: kCurvedNavigationBarButtonBackgroundColor,
          backgroundColor: kCurvedNavigationBarBackgroundColor,
          index: currentIndex,
          height: kCurvedBottomNavigationBarHeight,
          items: bottomNavigationBarIconsList,
        ),
      ),
    );
  }
}
