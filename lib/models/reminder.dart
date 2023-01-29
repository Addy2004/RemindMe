class Reminder{
  final String _title;
  final DateTime _dateTime;
  bool _control;

  String get title => _title;
  DateTime get dateTime => _dateTime;
  bool get control => _control;

  Reminder({required String title,
    required DateTime dateTime,
    bool control = true})
  :
        _title = title,
        _dateTime = dateTime,
        _control = control;

  void toggleSwitch(){
    _control = !_control;
  }
}