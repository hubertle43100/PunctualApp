import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clock_view.dart';
import 'main.dart';

hexColor(String colorhexcode){
  String colornew = '0xff' + colorhexcode;
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return colorint;
}

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

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Punctual',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(hexColor('#FFFFFF')), fontFamily: 'Rajdhani', fontSize: 64),
            ),
            Text(
              formattedTime,
              style: TextStyle(
                  color: Color(hexColor('#FFFFFF')), fontFamily: 'Rajdhani', fontSize: 25),
            ),
            Text(
              formattedDate,
              style: TextStyle(
                  color: Color(hexColor('#FFFFFF')), fontFamily: 'Rajdhani', fontSize: 25),
            ),
            SizedBox(height: 26),
            Image(
              image: AssetImage('assets/suit_20.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'This app will help you get out of the house in less than 15 mins',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(hexColor('#FFFFFF')), fontFamily: 'Rajdhani', fontSize: 25),
            ),
            SizedBox(height: 26),
            RaisedButton(
              color: Color(hexColor('#FF90A4')),
              highlightColor: Colors.pink[300],
              elevation: 10,
              highlightElevation: 20,
              //splashColor: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                Navigator
                    .push(
                  context,
                    MaterialPageRoute(
                        builder: (context) => Page3()
                    )
                );
              },
              child: Text(
                "Let's Start",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 26),
            RaisedButton(
              color: Color(hexColor('#FF90A4')),
              highlightColor: Colors.pink[300],
              elevation: 10,
              highlightElevation: 20,
              //splashColor: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Go Back",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget{
  Page3({Key key}) : super(key: key);

  @override
  Page3_1 createState() => Page3_1();
}

class Page3_1 extends State<Page3>{
  int _counter = 10;
  Timer _timer;

  void _startTimer(){
    _counter = 10;
    if(_timer != null){
      _timer.cancel();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Page4()),);

    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
    setState((){
      if(_counter > 0){
        _counter --;
      }
      else{
        _timer.cancel();
      }
    });
  });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(

          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 136),
            Text('Put on your best',
              style: TextStyle(
                color: Colors.white,
                fontFamily:'Rajdhani',
                fontSize: 30,
              ),
            ),
            Text('clothes for the day',
              style: TextStyle(
                color: Colors.white,
                fontFamily:'Rajdhani',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Image(
              image: AssetImage('assets/shirt.png'),
            ),
            (_counter > 0 )?
            Text(""):
            Text("DONE!!! press FINISH",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                  fontSize: 30,
                ),
             ),
            Text(
              '$_counter',
              style: TextStyle(
                color: Colors.white,
                  fontFamily:'Rajdhani',
                fontSize: 48,
              ),
            ),
            RaisedButton(
              color: Color(hexColor('#FF90A4')),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () => _startTimer(),
              child: Text("Start/Finish",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  )
              ),
            )
          ]
        ),
      )
    );
  }
}

class Page4 extends StatefulWidget{
  Page4({Key key}) : super(key: key);

  @override
  Page4_1 createState() => Page4_1();
}

class Page4_1 extends State<Page4>{
  int _counter = 10;
  Timer _timer;

  void _startTimer(){
    _counter = 10;
    if(_timer != null){
      _timer.cancel();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Page5()),);

    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState((){
        if(_counter > 0){
          _counter --;
        }
        else{
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(

            //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 136),
                Text('Time to pack up!',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  ),
                ),
                Text('Do not forget your essentials',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 50),
                Image(
                  image: AssetImage('assets/keys.png'),
                ),
                (_counter > 0 )?
                Text(""):
                Text("DONE!!! press FINISH",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  ),
                ),
                Text(
                  '$_counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 48,
                  ),
                ),
                RaisedButton(
                  color: Color(hexColor('#FF90A4')),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () => _startTimer(),
                  child: Text("Start/Finish",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:'Rajdhani',
                        fontSize: 30,
                      )
                  ),
                ),
              ]
          ),
        )
    );
  }
}

class Page5 extends StatefulWidget{
  Page5({Key key}) : super(key: key);

  @override
  Page5_1 createState() => Page5_1();
}

class Page5_1 extends State<Page5>{
  int _counter = 10;
  Timer _timer;

  void _startTimer(){
    _counter = 10;
    if(_timer != null){
      _timer.cancel();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Page6()),);

    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState((){
        if(_counter > 0){
          _counter --;
        }
        else{
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(

            //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 136),
                Text('Restroom break!!',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 50),
                Image(
                  image: AssetImage('assets/tp.png'),
                ),
                (_counter > 0 )?
                Text(""):
                Text("DONE!!! press FINISH",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  ),
                ),
                Text(
                  '$_counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 48,
                  ),
                ),
                RaisedButton(
                  color: Color(hexColor('#FF90A4')),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () => _startTimer(),
                  child: Text("Start/Finish",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:'Rajdhani',
                        fontSize: 30,
                      )
                  ),
                ),
              ]
          ),
        )
    );
  }
}

class Page6 extends StatefulWidget{
  Page6({Key key}) : super(key: key);

  @override
  Page6_1 createState() => Page6_1();
}

class Page6_1 extends State<Page6>{
  int _counter = 10;
  Timer _timer;

  void _startTimer(){
    _counter = 10;
    if(_timer != null){
      _timer.cancel();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Page7()),);

    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState((){
        if(_counter > 0){
          _counter --;
        }
        else{
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(

            //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 136),
                Text('Double check area!',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 50),
                Image(
                  image: AssetImage('assets/magn.png'),
                ),
                (_counter > 0 )?
                Text(""):
                Text("DONE!!! press FINISH",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  ),
                ),
                Text(
                  '$_counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 48,
                  ),
                ),
                RaisedButton(
                  color: Color(hexColor('#FF90A4')),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () => _startTimer(),
                  child: Text("Start/Finish",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:'Rajdhani',
                        fontSize: 30,
                      )
                  ),
                ),
              ]
          ),
        )
    );
  }
}

class Page7 extends StatefulWidget{
  Page7({Key key}) : super(key: key);

  @override
  Page7_1 createState() => Page7_1();
}

class Page7_1 extends State<Page7>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(

            //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 136),
                Text('Nice Ready to head out!',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:'Rajdhani',
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 50),
                Image(
                  image: AssetImage('assets/walking.png'),
                ),
                SizedBox(height: 36),
                RaisedButton(
                  color: Color(hexColor('#FF90A4')),
                  highlightColor: Colors.pink[300],
                  elevation: 10,
                  highlightElevation: 20,
                  //splashColor: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()),);
                  },
                  child: Text(
                    "Go Back",
                    style: TextStyle(fontSize: 20),
                  ),
                ),

              ]
          ),
        )
    );
  }
}