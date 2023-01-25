import 'package:flutter/material.dart';
import 'package:remind_me/constants.dart';
import 'package:remind_me/widgets/reminder_tile.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Menu Screen
    return Scaffold(
      backgroundColor: kMainScreenBackgroundColor,
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 341,
            backgroundColor: Colors.pink,
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
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
        itemCount: 30,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          return ReminderTile(index: index);
        },
      ),
      ],
    ),
  );
}
