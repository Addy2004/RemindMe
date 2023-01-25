import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  final int index;
  const ReminderTile({
    Key? key, required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTileTheme(
              dense: true,
              child: ExpansionTile(
                title: Center(
                  child: Text('Reminder ${index + 1}',
                    style: const TextStyle(color: Colors.pink),
                  ),
                ),
                childrenPadding: const EdgeInsets.all(10.0),
                children: const [
                  Padding(padding: EdgeInsets.all(10.0), child: Text('Text', style: TextStyle(color: Colors.pink),)),
                  Padding(padding: EdgeInsets.all(10.0), child: Text('Text', style: TextStyle(color: Colors.pink),)),
                  Padding(padding: EdgeInsets.all(10.0), child: Text('Text', style: TextStyle(color: Colors.pink),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}