import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  bool startPressed = true;
  bool stopPressed = true;
  bool resetPressed = true;
  String stopTime = "00.00.00.000";
  var swatch = Stopwatch();
  final dur = const Duration(milliseconds: 1000);

  void startTimer() {
    Timer(dur, keepRunning);
  }

  void keepRunning() {
    if(swatch.isRunning){
      startTimer();
    }
    setState(() {
      stopTime = swatch.elapsed.inHours.toString().padLeft(2,"0") + ":"
          + (swatch.elapsed.inMinutes%60).toString().padLeft(2, "0") + ":"
          + (swatch.elapsed.inSeconds%60).toString().padLeft(2, "0") + ":"
          + (swatch.elapsedMilliseconds%1000).toString().padLeft(3, "0");
    });
  }

  void startStopwatch(){
    setState(() {
      stopPressed = false;
      startPressed = false;
    });
    swatch.start();
    startTimer();
  }

  void stopStopwatch(){

    setState(() {
      stopPressed = true;
      resetPressed = false;
    });
    swatch.stop();
  }

  void resetStopwatch() {
    setState(() {
      startPressed = true;
      resetPressed = true;
    });
    swatch.reset();
    stopTime = "00.00.00.000";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stop Watch"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  stopTime,
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: stopPressed ? null : stopStopwatch,
                          color: Colors.blue[800],
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 15.0,
                          ),
                          child: Text(
                              "Stop",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              )
                          ),
                        ),
                        RaisedButton(
                          onPressed: resetPressed ? null : resetStopwatch,
                          color: Colors.blue[800],
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 15.0,
                          ),
                          child: Text("Reset",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              )
                          ),
                        ),
                      ],
                    ),
                    RaisedButton(
                      onPressed: startPressed ? startStopwatch : null,
                      color: Colors.blue[800],
                      padding: EdgeInsets.symmetric(
                        horizontal: 80.0,
                        vertical: 25.0,
                      ),
                      child: Text("Start",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
