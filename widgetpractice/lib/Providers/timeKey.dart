class TimeKey {
  DateTime dateTime = DateTime.now();
  String year;
  String month;
  String day;
  int hourC;
  int min;

  TimeKey() {
    this.year = dateTime.year.toString();
    this.month = dateTime.month.toString();
    this.day = dateTime.day.toString();
    this.hourC = dateTime.hour.toInt();
    this.min = dateTime.minute.toInt();
  }

  String getToday() {
    String hour = hourC.toString();

    if (hour.length < 2) hour = '0' + hour;

    if (day.length < 2) day = '0' + day;

    if (month.length < 2) month = '0' + month;

    String result = year + '-' + month + '-' + day;

    result = checkWeekend(result, true);

    return result;
  }

  String getCurrentTime() {
    while (min % 5 != 0) {
      min--;
    }

    String minFive = min.toString();

    if (minFive.length < 2) minFive = '0' + minFive;

    if (hourC > 16) {
      hourC = 16;
      minFive = '00';
    }

    String hour = hourC.toString();

    if (hour.length < 2) hour = '0' + hour;

    if (day.length < 2) day = '0' + day;

    if (month.length < 2) month = '0' + month;

    String sec = '00';

    String result =
        year + '-' + month + '-' + day + ' ' + hour + ':' + minFive + ':' + sec;

    result = checkWeekend(result, false);

    return result;
  }

  String checkWeekend(String dateInput, bool isDay) {
    DateTime weekendCheck = DateTime.parse(dateInput);
    DateTime check;
    String result;

    if (weekendCheck.weekday == DateTime.saturday) {
      check = weekendCheck.subtract(new Duration(days: 1));
    } else if (weekendCheck.weekday == DateTime.sunday) {
      check = weekendCheck.subtract(new Duration(days: 2));
    } else
      check = weekendCheck;

    if (isDay) {
      result = check.toString().substring(0, 10);
    } else
      result = check.toString();

    return result.toString();
  }
}
