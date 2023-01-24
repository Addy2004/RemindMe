import 'package:flutter/material.dart';
import 'package:remind_me/constants.dart';

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
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/pedro.gif'),
            ),
            title: const Center(
                child: Text('Text',
                  style: TextStyle(color: Colors.pink),
                ),
            ),
          ),
          SliverToBoxAdapter(
            child: widget(),
          )
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
          return ListTile(
            leading: const Icon(Icons.access_alarms_sharp, color: Colors.white,),
            trailing: const Text('GFG',
              style: TextStyle(color: Colors.white),),
            title: Text('Reminder ${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
      ],
    ),
  );
}