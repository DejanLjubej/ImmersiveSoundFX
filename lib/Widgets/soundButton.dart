import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:temp/assetManager/listOfSounds.dart';
import 'package:temp/assetManager/directoryGetFiles.dart';
import 'buttonState.dart';
//import 'package:temp/main.dart';
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
                  audioCache.play(GetItemsFromAssetsState.avatars[i].toString().split("/")[1]);
                },
                child: Container(
                  padding: EdgeInsets.all(7),
                  width: 150,
                  child: Text(
                    //ExampleAppState.mainSounds[i],
                    //soundList[i],
                    GetItemsFromAssetsState.avatars[i].toString().split("/")[1].split(".mp3")[0],

                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ))
          ]));
}
