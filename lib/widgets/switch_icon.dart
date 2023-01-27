import 'package:flutter/material.dart';
import 'package:remind_me/constants.dart';

class SwitchIcon extends StatefulWidget {
  final bool switchIconColorCondition;
  final IconData icon;
  const SwitchIcon({
    required this.switchIconColorCondition,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  State<SwitchIcon> createState() => _SwitchIconState();
}

class _SwitchIconState extends State<SwitchIcon> {
  @override
  Widget build(BuildContext context) {
    return  Icon(
      widget.icon,
      //Switches icon's color when the page gets changed
      color: widget.switchIconColorCondition ? kCurvedNavigationBarActiveIconColor : kCurvedNavigationBarIconColor,
      //Switches icon's size when the page gets changed
      size: widget.switchIconColorCondition ? kCurvedNavigationBarActiveIconSize : kCurvedNavigationBarIconSize,
    );
  }
}