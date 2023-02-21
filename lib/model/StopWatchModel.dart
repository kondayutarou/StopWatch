import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stopwatch/model/StopWatchUtil.dart';

class StopWatchTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool _isDark = false;

  void toggle() {
    _isDark = !_isDark;
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}

class StopWatchState extends ChangeNotifier {
  final Stopwatch _stopWatchTimer = Stopwatch();

  void startClock() {
    _stopWatchTimer.start();
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      notifyListeners();
    });
  }

  void stopClock() {
    _stopWatchTimer.stop();
  }

  void resetClock() {
    _stopWatchTimer.reset();
  }

  String getHours() {
    return _stopWatchTimer.elapsed.hoursForStopWatch().toString().padLeft(2, "0");
  }

  String getMinutes() {
    return _stopWatchTimer.elapsed.minutesForStopWatch().toString().padLeft(2, "0");
  }

  String getSeconds() {
    return _stopWatchTimer.elapsed.secondsForStopWatch().toString().padLeft(2, "0");
  }

  String getMilliseconds() {
    return _stopWatchTimer.elapsed.millisecondsForStopWatch().toString().padLeft(4, "0");
  }
}