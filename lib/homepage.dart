import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clock_view.dart';
import 'main.dart';
import 'Page_2.dart';

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
      color: Colors.green,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Punctual',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontFamily: 'Rajdhani', fontSize: 64),
          ),
          Text(
            formattedTime,
            style: TextStyle(
                color: Colors.white, fontFamily: 'Rajdhani', fontSize: 25),
          ),
          Text(
            formattedDate,
            style: TextStyle(
                color: Colors.white, fontFamily: 'Rajdhani', fontSize: 25),
          ),
          SizedBox(height: 36),
          ClockView(),
          SizedBox(height: 36),
//              Padding(
//                padding: const EdgeInsets.all(20.0),
//                child: FlatButton(onPressed: (){},
//                  color: Colors.red,
//                  textColor: Colors.white,
//                  highlightColor: Colors.green,
//                  //splashColor: Colors.cyan,
//                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//                  child: Text("Flat Button",
//                      style: TextStyle(fontSize:24)), ),
//              ),
          RaisedButton(
              color: Colors.pink[200],
              highlightColor: Colors.pink[300],
              elevation: 10,
              highlightElevation: 20,
              //splashColor: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                Navigator.push(context,
                PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder:
                        (context, animation, animationTime, child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.elasticInOut);
                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: animation,
                        child: child,
                      );
                      },
                      pageBuilder: (context, animation, animationTime) {
                        return Page2();
                      },
                ));
              },
              child: Text(
                "HEADING OUT",
                style: TextStyle(fontSize: 20),
              ),
          )
        ],
      ),
    ),
    );
  }
}
