import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimerapp/pages/clock.dart';
import 'package:worldtimerapp/pages/loading.dart';
import 'package:worldtimerapp/pages/stopwatch.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedPage = 0;
  final _pageOptions = [
    Clock(),
    StopWatch(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;



          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text("World Clock"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text("Stop Watch"),
          ),
        ],
      ),
    );
  }
}
