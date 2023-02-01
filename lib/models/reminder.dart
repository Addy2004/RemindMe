// ignore_for_file: unnecessary_getters_setters

class Reminder{
  String _title;
  DateTime _dateTime;
  bool _control;

  String get title => _title;
  DateTime get dateTime => _dateTime;
  bool get control => _control;

  set title(String title){
    _title = title;
  }

  set dateTime(DateTime dateTime){
    _dateTime = dateTime;
  }

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