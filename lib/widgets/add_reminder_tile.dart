import 'package:flutter/material.dart';
import 'package:remind_me/screens/add_reminder_screen.dart';

class AddReminderTile extends StatelessWidget {
  const AddReminderTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListTileTheme(
            dense: true,
            child: ListTile(
              trailing: const Padding(
                  padding: EdgeInsets.only(right: 65.0),
                  child: Icon(Icons.add_alarm,
                    color: Colors.pink),
              ),
              title: const Padding(
                padding: EdgeInsets.only(left: 65.0),
                child: Text('Add new reminder',
                  style: TextStyle(color: Colors.pink),
                ),
              ),
              onTap: (){
                showModalBottomSheet(
                  barrierColor: Colors.black.withAlpha(1),
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        color: Colors.transparent,
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const AddReminderScreen(),
                      ),
                    ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}