import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/StopWatchUtil.dart';

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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => StopWatchTheme(),
        child: Consumer<StopWatchTheme>(
          builder: (context, theme, _) {
            return MaterialApp(
              theme: theme.current,
              home: Scaffold(
                  appBar: AppBar(),
                  body: ChangeNotifierProvider(create: (_) => StopWatchState(),
                    child: Consumer<StopWatchState>(
                      builder: (context, state, _) {
                        return Column(
                          children: [
                            FilledButton(onPressed: () {
                              Provider.of<StopWatchState>(context, listen: false).startClock();
                            }, child: Text("Start")),
                            FilledButton(onPressed: () {
                              Provider.of<StopWatchState>(context, listen: false).stopClock();
                            }, child: Text("Stop")),
                            FilledButton(onPressed: () {
                              Provider.of<StopWatchState>(context, listen: false).resetClock();
                            }, child: Text("Reset")),
                            FilledButton(onPressed: () {
                              Provider.of<StopWatchTheme>(context, listen: false).toggle();
                            }, child: Text("Change theme")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(state._stopWatchTimer.elapsed.hoursForStopWatch().toString().padLeft(2, "0")),
                                Text(":"),
                                Text(state._stopWatchTimer.elapsed.minutesForStopWatch().toString().padLeft(2, "0")),
                                Text(":"),
                                Text(state._stopWatchTimer.elapsed.secondsForStopWatch().toString().padLeft(2, "0")),
                                Text(":"),
                                Text(state._stopWatchTimer.elapsed.millisecondsForStopWatch().toString().padLeft(4, "0"))
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
              ),
            );
          },
        ),
    );
  }
}
