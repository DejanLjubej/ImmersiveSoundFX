import 'package:flutter/material.dart';
import 'buttonRow.dart';

class ButtonListDisplay extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ButtonListDisplay> {
  
  String localFilePath;

  @override
  Widget build(BuildContext context) {
  int _i =-2;
  int _number = 10;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Situational Sound Effects'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _number,
          itemBuilder: (BuildContext context, int index){
            _i +=2;
            return rowOfButtons(_i);
          }
        ),
      ),
    );
  }
}