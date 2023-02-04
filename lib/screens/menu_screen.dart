import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me/Utils/appcolors.dart';
import 'package:remind_me/constants.dart';
import 'package:remind_me/models/reminder_data.dart';
import 'package:remind_me/widgets/add_reminder_tile.dart';
import 'package:remind_me/widgets/reminder_tile.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO Menu Screen
    return Scaffold(
      backgroundColor: pinkCLr,
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: kSliverAppBarExpandedHeight,
            backgroundColor: kSliverAppBarBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/pedro.gif'),
            ),
            title: const Center(
              child: Text(':(',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: widget(),
          ),
        ],
      ),
    );

  }
}
 Widget widget(){
   return SingleChildScrollView(
     physics: const ScrollPhysics(),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         const AddReminderTile(),
         const Padding(
           padding: EdgeInsets.only(top: 25.0),
           child: Text('Set Reminders',
             style: TextStyle(color: Colors.white),
           ),
         ),
         Consumer<ReminderData>(
           builder: (context, reminderData, child){
             return ListView.builder(
               physics: const NeverScrollableScrollPhysics(),
               scrollDirection: Axis.vertical,
               itemCount: reminderData.reminderCount,
               shrinkWrap: true,
               itemBuilder: (BuildContext context, int index){
                 return ReminderTile(index: index);
               },
             );
           },
         ),
       ],
     ),
   );
 }