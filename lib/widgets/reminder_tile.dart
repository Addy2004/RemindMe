import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remind_me/models/reminder.dart';
import 'package:remind_me/models/reminder_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:remind_me/screens/edit_reminder_screen.dart';
import 'package:remind_me/widgets/customized_cupertino_context_menu/cupertino_context_menu.dart';
import 'package:remind_me/widgets/extra_functions.dart';

class ReminderTile extends StatefulWidget {
  final int index;
  const ReminderTile({
    Key? key, required this.index
  }) : super(key: key);

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {
  @override
  Widget build(BuildContext context) {
    final DateFormat format = DateFormat('MMMM');
    return Consumer<ReminderData>(
      builder: (context, reminderData, child){
        final reminder = reminderData.reminders[widget.index];
        return CustomizedCupertinoContextMenu(
          previewBuilder: (context, animation, child){
            return SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTileTheme(
                    dense: true,
                    child: ExpansionTile(
                      trailing: CupertinoSwitch(
                          activeColor: Colors.pink,
                          value: reminder.control,
                          onChanged: (bool? value){

                          }),
                      title: Align(
                        alignment: const Alignment(-0.75, 0),
                        child: Text(reminder.title,
                          style: const TextStyle(
                              color: Colors.pink),
                        ),
                      ),
                      childrenPadding: const EdgeInsets.all(10.0),
                      children: [
                        Padding(padding: const EdgeInsets.all(10.0),
                          child: Text('${reminder.dateTime.day} '
                              '${format.format(reminder.dateTime)} '
                              '${reminder.dateTime.year}, '
                              '${pad(reminder.dateTime.hour)}:'
                              '${pad(reminder.dateTime.minute)}',
                            style: const TextStyle(color: Colors.pink),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10.0),
                          child: Text('Text',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10.0),
                          child: Text('Text',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            );
          },
          actions: [
            CupertinoContextMenuAction(
              onPressed: (){
                setState(() {
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
                        child: EditReminderScreen(reminder: reminder, index: widget.index),
                      ),
                    ),
                  );
                });
              },
              isDefaultAction: true,
              trailingIcon: Icons.edit,
              child: const Text('Edit'),
            ),
            CupertinoContextMenuAction(
              onPressed: (){
                setState(() {
                  reminderData.remove(reminder);
                  Navigator.pop(context);
                });
              },
              isDestructiveAction: true,
              trailingIcon: Icons.delete,
              child: const Text('Delete'),
            )
          ],
          child: buildCard(reminder, reminderData, format),
        );
      },
    );
  }

  Card buildCard(Reminder reminder, ReminderData reminderData, DateFormat format) {
    return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTileTheme(
                dense: true,
                child: ExpansionTile(
                  trailing: CupertinoSwitch(
                      activeColor: Colors.pink,
                      value: reminder.control,
                      onChanged: (bool? value){
                        setState(() {
                          reminderData.toggleControl(reminder);
                        });
                      }),
                  title: Align(
                    alignment: const Alignment(-0.75, 0),
                    child: Text(reminder.title,
                      style: const TextStyle(
                          color: Colors.pink),
                    ),
                  ),
                  childrenPadding: const EdgeInsets.all(10.0),
                  children: [
                    Padding(padding: const EdgeInsets.all(10.0),
                      child: Text('${reminder.dateTime.day} '
                          '${format.format(reminder.dateTime)} '
                          '${reminder.dateTime.year}, '
                          '${pad(reminder.dateTime.hour)}:'
                          '${pad(reminder.dateTime.minute)}',
                        style: const TextStyle(color: Colors.pink),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0),
                      child: Text('Text',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0),
                      child: Text('Text',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}