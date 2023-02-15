import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';


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

    return MaterialApp(
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
              print(_stopWatchTimer.elapsedMilliseconds);
            }, child: Text("Show")),
            FilledButton(onPressed: () {
              _stopWatchTimer.reset();
            }, child: Text("Reset")),
            Text(_stopWatchTimer.elapsed.inSeconds.toString()),
          ],
        ),
      ),
    );
  }
}
