import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

Widget tryoutButton(int i) {
  AudioCache audioCache = new AudioCache();
  return Expanded(
      flex: 1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Colors.deepPurple[900],
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(1.0),
              splashColor: Colors.blueAccent,
              
              onPressed: () {
                audioCache.play('running.wav');
              },
              child:Container(
                padding: EdgeInsets.all(7),
                width: 100,
                child: 
                  Text(
                    'NOo0ossss0o0o0!',
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    
                    style: TextStyle(fontSize: 20.0),
                  ),
              ) 
            )
          ]));
}
