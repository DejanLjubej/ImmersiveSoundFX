import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget tryoutButton(int i){
  AudioCache audioCache = new AudioCache();
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
        i.toString(),
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }