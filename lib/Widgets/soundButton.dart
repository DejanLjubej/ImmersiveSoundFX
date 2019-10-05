//import 'package:audioplayer/audioplayer.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:temp/Functionalities/Test.dart';
import 'package:temp/assetManager/directoryGetFiles.dart';
import 'buttonState.dart';




//import 'package:temp/main.dart';
//AudioPlayer player = new AudioPlayer();
Widget tryoutButton(int i) {
  AudioPlayer advancedPlayer = new AudioPlayer();
AudioCache audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  audioCache.load(GetItemsFromAssetsState.avatars[i]
                      .toString()
                      .split("/")[1]);
  return Expanded(
      flex: 1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            GestureDetector(
            onLongPress: () {
              advancedPlayer.stop();
            },
            
            child:
            RaisedButton(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                color: Color.fromARGB(255, 42, 26, 94),
                textColor: Color.fromARGB(255, 251, 229, 85), 
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(1.0),
                splashColor: Colors.blueAccent,
                 onPressed: () {
              
                  
                  audioCache.play(GetItemsFromAssetsState.avatars[i]
                      .toString()
                      .split("/")[1], volume: 2);
                },
                 
                child: Container(
                  padding: EdgeInsets.all(7),
                  width: 150,
                  child: Text(
                    GetItemsFromAssetsState.avatars[i]
                        .toString()
                        .split("/")[1]
                        .split(".mp3")[0],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ))
            ),
          ]));
}
