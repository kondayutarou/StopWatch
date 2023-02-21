import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/model/StopWatchModel.dart';

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
                                Text(Provider.of<StopWatchState>(context, listen: false).getHours()),
                                Text(":"),
                                Text(Provider.of<StopWatchState>(context, listen: false).getMinutes()),
                                Text(":"),
                                Text(Provider.of<StopWatchState>(context, listen: false).getSeconds()),
                                Text(":"),
                                Text(Provider.of<StopWatchState>(context, listen: false).getMilliseconds()),
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
