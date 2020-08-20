import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('page 1')),
      body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .pop();
            },
            child: Text('Open page 2'),
          )),
    );
  }
}

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('page 2')),
      body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .pop();
            },
            child: Text('Open page 1'),
          )),
    );
  }
}