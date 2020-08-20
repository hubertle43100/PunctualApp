import 'dart:async';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'main.dart';

class MyPage extends StatefulWidget{
  MyPage({Key key}): super(key: key);

  @override
  Page2 createState() => Page2();
}


class Page2 extends State<MyPage> {

  int _counter = 10;
  Timer _timer;

  void _startTimer() {
    _counter = 10;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter --;
        }
        else {
          _timer.cancel();
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Timer"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (_counter > 0) ? Text("") : Text("Done",
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: "Rajdhani",
                      fontSize: 40),
                ),
                Text(
                  '$_counter', style: TextStyle(
                  fontFamily: "Rajdhani",
                  fontSize: 40,
                ),
                ),
                RaisedButton(
                  onPressed: () => _startTimer(),
                  child: Text("Start in 10"),
                )
              ],
            )
        )
    );
  }
}
