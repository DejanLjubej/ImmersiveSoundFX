import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget tryoutButton(int i) {
  AudioCache audioCache = new AudioCache();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            shape: CircleBorder(),
            elevation: 10,
            color: Colors.blue,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(50.0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              audioCache.play('running.wav');
            },
            child: Text(
              i.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      )
    ],
  );
}
