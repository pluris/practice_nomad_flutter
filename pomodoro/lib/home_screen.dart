import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const INITIAL_TIME = 1500; // 25 minute
  int totalSeconds = 1500;
  int totalPomodoros = 0;
  late Timer timer;
  bool isRunning = false;

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    final formatString = duration.toString().split(".").first.substring(2, 7);
    return formatString;
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = INITIAL_TIME;
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        if (totalSeconds > 0) {
          totalSeconds--;
        }
      });
    }
  }

  void onStartPressed() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), onTick);
  }

  void onPausePressed() {
    setState(() {
      isRunning = false;
    });
    timer.cancel();
  }

  void onRefresh() {
    setState(() {
      totalSeconds = INITIAL_TIME;
      totalPomodoros = 0;
      isRunning = false;
    });
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 150,
                    color: Theme.of(context).cardColor,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                  ),
                  IconButton(
                    iconSize: 50,
                    color: Theme.of(context).cardColor,
                    icon: Icon(Icons.refresh),
                    onPressed: onRefresh,
                  )
                ],
              )),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pomodoros',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color),
                            ),
                            Text(
                              '$totalPomodoros',
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
