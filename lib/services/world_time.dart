import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  int isDay;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String addSub = data['utc_offset'].substring(0, 1);
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4);

      DateTime now = DateTime.parse(datetime);
      if (addSub == '+'){
        now = now.add(Duration(
            hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
      } else {
        now = now.subtract(Duration(
            hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
      }


      if (now.hour >= 6 && now.hour <= 7) {
        isDay = 1;
      } else if (now.hour > 8 && now.hour < 18) {
        isDay = 2;
      } else if (now.hour >= 18 && now.hour <= 19) {
        isDay = 3;
      } else {
        isDay = 0;
      }
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Caught error: $e");
      time = "Could not get data";
    }
  }
}
