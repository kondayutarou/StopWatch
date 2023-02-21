import 'dart:core';

extension DurationExt on Duration {
  int secondsForStopWatch() {
    int totalSeconds = inSeconds;
    int totalMinutes = inMinutes;
    return totalSeconds - totalMinutes * 60;
  }

  int minutesForStopWatch() {
    int totalMinutes = inMinutes;
    int totalHours = inHours;
    return totalMinutes - totalHours * 60;
  }

  int hoursForStopWatch() {
    int totalHours = inHours;
    int totalDays = inDays;
    return totalHours - totalDays * 24;
  }
}