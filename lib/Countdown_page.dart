import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'main.dart';
import 'homepage.dart';


int timer = 30;
String showtimer = "30";



class NONE extends StatelessWidget {
  @override
  void initState(){
    initState();
    starttimer();
  }
  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t){
      setState(){
        if(timer < 1){
          t.cancel();
        }
        else{
          timer = timer - 1;
        }
        showtimer = timer.toString();
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Text(
                'Sample quote',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Rajdhani",
                ),
              ),
              ),
            ),
          Expanded(

            child: RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop();
              },
              child: Text('Open page 1'),
            ),
          ),
          Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    "30",
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Rajdhani"
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
//  AnimationController controller;
//  String get timerString{
//    Duration duration = controller.duration * controller.value;
//    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
//  }
//
//  @override
//  void initState(){
//    super.initState();
//    controller = AnimationController(
//      vsync:  this,
//      duration: Duration(seconds: 20),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context){
//    return Scaffold(
//      body: Padding(
//        child: Column(
//          children: <Widget>[
//            Expanded(
//              child:Align(
//                alignment: FractionalOffset.center,
//                child: AspectRatio(
//                  aspectRatio: 1,
//                  child:Stack(
//                    children: <Widget>[
//                      Positioned.fill(
//                        child: AnimatedBuilder(
//                          animation: controller,
//                          builder: (BuildContext context, Widget child){
//                            return new CustomPaint(
//                              painter:TimerPainter(
//                                animation: controller,
//                                backgroundColor: Colors.white,
//                                color: Colors.pink,
//                              )
//                            );
//                          }
//
//                        )
//                      )
//                    ],
//                  )
//                )
//              )
//            )
//          ]
//        ),
//      )
//
//    )
//  }
//}
//
//class TimerPainter extends CustomPainter {
//  TimerPainter({
//    this.animation,
//    this.backgroundColor,
//    this.color,
//  }) : super(repaint: animation);
//  final Animation<double> animation;
//  final Color backgroundColor, color;
//
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    Paint paint = Paint()
//      ..color = backgroundColor
//      ..strokeWidth = 5
//      ..strokeCap = StrokeCap.round
//      ..style = PaintingStyle.stroke;
//
//    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
//    paint.color = color;
//    double progress = (1 - animation.value) * 2 * math.pi;
//    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
//  }
//
//  @override
//  bool shouldRepaint(TimerPainter old) {
//    return animation.value != old.animation.value ||
//        color != old.color ||
//        backgroundColor != old.backgroundColor;
//  }
//}
