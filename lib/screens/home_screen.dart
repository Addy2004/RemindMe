import 'package:flutter/material.dart';
import 'package:remind_me/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    //TODO Home Screen
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'RemindMe',
              style: kMainScreenHeadingTextStyle,
            ),
            Text(
              'Hi, User!',
              style: kUserGreetTextStyle,
            )
          ],
        ),
      ),
    );
  }
}

// i was here #rissshaaav
// ,ajshddfbkajsdsfghjsfgjsfg
// i was not here
// here again