import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  
  Widget build (BuildContext context){
    
    return MaterialApp(
      title: 'Situational Sound Effects',
      home: ButtonListDisplay(),
    );
  }
}

class ButtonListDisplay extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ButtonListDisplay> {
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String localFilePath;

  @override
  Widget build(BuildContext context) {
    int number = 1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Situational Sound Effects'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: number,
            itemBuilder: (BuildContext context, int index){
              return tryoutButton();
            }
          ),
        ), 
      );
  }
  Widget tryoutButton(){
    return  FlatButton(
     
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        audioCache.play('running.wav');
      },
      child: Text(
        "Sound Name/Icon",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}