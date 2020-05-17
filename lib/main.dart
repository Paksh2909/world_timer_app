import 'package:flutter/material.dart';
import 'package:worldtimerapp/pages/choose_location.dart';
import 'package:worldtimerapp/pages/clock.dart';
import 'package:worldtimerapp/pages/home.dart';
import 'package:worldtimerapp/pages/loading.dart';
import 'package:worldtimerapp/pages/stopwatch.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/clock': (context) => Clock(),
        '/location': (context) => ChooseLocation(),
        '/stopwatch': (context) => StopWatch(),
      },
    ));
