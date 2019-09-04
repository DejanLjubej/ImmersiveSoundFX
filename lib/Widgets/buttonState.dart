import 'package:flutter/material.dart';
import 'soundButton.dart';

int _number = 7;

class ButtonListDisplay extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ButtonListDisplay> {
  
  String localFilePath;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Situational Sound Effects'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _number,
            itemBuilder: (BuildContext context, int index){
              return tryoutButton(index);
            }
          ),
        ), 

      );
  }
}