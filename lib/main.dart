import 'package:flutter/material.dart';
import 'Widgets/buttonState.dart';





void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  
  Widget build (BuildContext context){
    
    return MaterialApp(
      title: 'Situational Sound Effects',
      home: ButtonListDisplay(),
      theme: ThemeData(
        brightness:     Brightness.light,
        canvasColor:    Colors.blue[50],
        primaryColor:   Colors.blueGrey[700],
        accentColor:    Colors.amber,
    ),
    );
  }
}





  
  
