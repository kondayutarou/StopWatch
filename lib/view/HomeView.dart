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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final Stopwatch _stopWatchTimer;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopWatchTimer = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => StopWatchTheme(),
    child: Consumer<StopWatchTheme>(
      builder: (context, theme, _) {
        return MaterialApp(
          theme: theme.current,
          home: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                FilledButton(onPressed: () {
                  _stopWatchTimer.start();
                }, child: Text("Start")),
                FilledButton(onPressed: () {
                  _stopWatchTimer.stop();
                }, child: Text("Stop")),
                FilledButton(onPressed: () {
                  _stopWatchTimer.reset();
                }, child: Text("Reset")),
                FilledButton(onPressed: () {
                  Provider.of<StopWatchTheme>(context, listen: false).toggle();
                }, child: Text("Change theme")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_stopWatchTimer.elapsed.hoursForStopWatch().toString()),
                    Text(":"),
                    Text(_stopWatchTimer.elapsed.minutesForStopWatch().toString()),
                    Text(":"),
                    Text(_stopWatchTimer.elapsed.secondsForStopWatch().toString()),
                    Text(":"),
                    Text(_stopWatchTimer.elapsed.millisecondsForStopWatch().toString())
                  ],
                )
              ],
            ),
          ),
        );
      },
    )
    );


  }
}
