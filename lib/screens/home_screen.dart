import 'package:flutter/material.dart';
import 'package:remind_me/constants.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    //TODO Home Screen
    // return SafeArea(
    //   child: Padding(
    //     padding: const EdgeInsets.all(20.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: const [
    //         Text(
    //           'RemindMe',
    //           style: kMainScreenHeadingTextStyle,
    //         ),
    //         Text(
    //           'Hi, User!',
    //           style: kUserGreetTextStyle,
    //         )
    //       ],
    //     ),
    //   ),
    //   EventCalendarScreen();
    // );
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(
        scaffoldBackgroundColor: homeScreenBackgroundColor,
      ),
      home: const EventCalendarScreen(),
    );
  }
}

class EventCalendarScreen extends StatefulWidget {
  const EventCalendarScreen({Key? key}) : super(key: key);

  @override
  State<EventCalendarScreen> createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {

  DateTime _focusedDay = DateTime.now(); //current day
  DateTime? _selectedDate; //date user will select

  Map<String, List> mySelectedEvents = {}; //wil hold the events map

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;

    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2023-01-16": [
        {"eventTitle": "Hello", "eventDesc": "World"},
        {"eventTitle": "namaste", "eventDesc": "duniya"}
      ],
      "2023-01-30": [
        {"eventTitle": "byebye", "eventDesc": "bye"}
      ],
      "2023-01-27": [
        {"eventTitle": "one", "eventDesc": "two"}
      ]
    };
  }

  //required for the eventLoader
  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        // backgroundColor: kMainScreenBackgroundColor,
        centerTitle: true,
        title: const Text('RemindMe'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  // color: Colors.grey[300],
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime(2023),
                lastDay: DateTime(2024),

                startingDayOfWeek: StartingDayOfWeek.monday,
                rowHeight: 40,

                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),

                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                ),

                calendarStyle: const CalendarStyle(
                  weekendTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  defaultTextStyle: TextStyle(fontWeight: FontWeight.bold),

                  //for styling the current date wala circle
                  todayDecoration: BoxDecoration(
                    color: todayDateColor,
                    shape: BoxShape.circle,
                  ),

                  // for styling the selected date wala circle
                  selectedDecoration: BoxDecoration(
                    color: userSelectedDateColor,
                    shape: BoxShape.circle,
                  ),

                ),

                // to keep focus on user selected date as well as current date
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDate, selectedDay)) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },

                //called whenever the calendar page is changed
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },

                eventLoader: _listOfDayEvents,
              ),
            ),
          ),

          //displaying added events below calendar
          ..._listOfDayEvents(_selectedDate!).map(
            (myEvents) => Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.done,
                  color: Colors.teal,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  // child: Text('Event Title: ${myEvents['eventTitle']}'),
                  child: Text('${myEvents['eventTitle']}'),
                ),
                // subtitle: Text('Description: ${myEvents['eventDesc']}'),
                subtitle: Text('${myEvents['eventDesc']}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
