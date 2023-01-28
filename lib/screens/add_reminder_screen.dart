import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remind_me/models/reminder.dart';
import 'package:remind_me/models/reminder_data.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({Key? key}) : super(key: key);

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  String reminderName = "Buy me a coffee";
  DateTime dateTime = DateTime.now();
  final DateFormat format = DateFormat('MMM');
  @override
  Widget build(BuildContext context) {
    String pad(int input){
      String str = "";
      if(input > 9){
        str = input.toString();
      }
      else{
        str = "0${input.toString()}";
      }
      return str;
    }
    void showDialog(Widget child){
      showCupertinoModalPopup<void>(context: context,
          builder: (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(
                top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: Colors.pink,
            child: SafeArea(
              top: false,
              child: child,
            ),
          ),
      );
    }
    return Container(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      decoration: const BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Add new reminder',
                style: TextStyle(color: Colors.white, fontSize: 18.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Stack(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26.withOpacity(0.1675),
                          blurRadius: 7.5,
                          spreadRadius: 5
                      )
                    ]
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    reminderName = value;
                  },
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.pink,
                    hintText: reminderName,
                    hintStyle: const TextStyle(color: Colors.white70),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Date and Time',
                style: TextStyle(color: Colors.white, fontSize: 18.5),
              ),
            ),
          ),
          ButtonTheme(
            minWidth: 10.0,
            child: OutlinedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10.0),
                backgroundColor: MaterialStateProperty.all(Colors.pink),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(
                    top: 20.0, bottom: 20.0,
                left: 40.0, right: 40.0),
                ),
                side: MaterialStateProperty.all(const BorderSide(width: 1.0, color: Colors.white)),
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                ),
                ),
              ),
              onPressed: () => showDialog(
              CupertinoTheme(
                data: const CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      color: Colors.white,
                    )
                  )
                ),
                child: CupertinoDatePicker(
                  initialDateTime: dateTime,
                  mode: CupertinoDatePickerMode.dateAndTime,
                  use24hFormat: true,
                  onDateTimeChanged: (DateTime newDateTime){
                    setState(() {
                      dateTime = newDateTime;
                    });
                  },
                ),
              ),
            ),
              child: Text('${dateTime.day} '
                  '${format.format(dateTime)} '
                  '${dateTime.year} '
                  '${pad(dateTime.hour)}:${pad(dateTime.minute)}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          TextButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10.0),
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(
                top: 10.0, bottom: 10.0,
                left: 120.0, right: 120.0,
              ),
              ),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                  ),
              )
            ),
            onPressed: () {
              Provider.of<ReminderData>(context, listen: false).add(Reminder(title: reminderName, dateTime: dateTime));
              Navigator.pop(context);
            },
            child: const Text('Add',
              style: TextStyle(color: Colors.pink),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
