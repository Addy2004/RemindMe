DateTime dateTimeChecker(DateTime dateTime){
  final DateTime now = DateTime.now().copyWith(second: 0, millisecond: 0, microsecond: 0);
  if(now.compareTo(dateTime) > 0){
    return dateTime.copyWith(year: now.year + 1, second: 0, microsecond: 0, millisecond: 0);
  }
  return dateTime.copyWith(second: 0, microsecond: 0, millisecond: 0);
}

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