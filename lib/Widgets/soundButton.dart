import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

Widget tryoutButton(int i) {
  AudioCache audioCache = new AudioCache();
  return Expanded(
    flex:1, 
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,

    children: <Widget>[
      Expanded(flex:1, child: RaisedButton(
        shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(60.0),
    ),
    
        elevation: 10,
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(10.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          audioCache.play('running.wav');
        },
        child: Text(
          (i+1).toString()+'sadfadfadf',
          overflow: TextOverflow.fade,
          maxLines: 1,
          style: TextStyle(fontSize: 20.0),
        ),
      )
      )],
  ));
}
