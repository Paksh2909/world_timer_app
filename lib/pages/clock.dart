import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimerapp/services/world_time.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Map data = {};
//  void setUpTime() async {
//    WorldTime instance = WorldTime(location: 'Mumbai', flag: 'India.png', url: 'Asia/Kolkata');
//    await instance.getTime();
//    data['location'] = instance.location;
//    data['flag'] = instance.flag;
//    data['time'] = instance.time;
//    data['isDay'] = instance.isDay;
//  }

  @override
  Widget build(BuildContext context) {
    print("Build of clock ran");
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //setUpTime();
    print(data);
    String bgImage;

    if (data['isDay'] == 0) {
      bgImage = 'night.jpg';
    } else if (data['isDay'] == 1) {
      bgImage = 'dawn.jpg';
    } else if (data['isDay'] == 2) {
      bgImage = 'day.jpg';
    } else if (data['isDay'] == 3) {
      bgImage = 'dusk.jpg';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("World Clock"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 190.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 66.0,
                ),
              ),
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDay': result['isDay'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text("Edit Location",
                      style: TextStyle(
                        color: Colors.grey[300],
                      ))),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
