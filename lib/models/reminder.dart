class Reminder{
  final String _title;
  final DateTime _dateTime;

  String get title => _title;
  DateTime get dateTime => _dateTime;

  Reminder({required String title,
    required DateTime dateTime})
  : _title = title, _dateTime = dateTime;
}