import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clock_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;

    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          alignment: Alignment.center,
          color: Colors.blueAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 32),
              Text('Punctual',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Rajdhani', fontSize: 64),
              ),
              Text(formattedTime,
                style: TextStyle(
                    color: Colors.white,fontFamily: 'Rajdhani', fontSize: 25),
              ),
              Text(formattedDate,
                style: TextStyle(
                    color: Colors.white,fontFamily: 'Rajdhani', fontSize: 25),
              ),
              SizedBox(height: 16),

              ClockView(),
            ],
          ),
        ));
  }
}