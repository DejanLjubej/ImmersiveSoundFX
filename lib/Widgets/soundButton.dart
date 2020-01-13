import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

import 'package:ImmersiveSoundFX/assetManager/directoryGetFiles.dart';
import 'package:flutter/scheduler.dart';

import '../Styles/CollorPallete.dart';

class MainButton extends StatefulWidget {
  final int i;
  MainButton(this.i);

  @override
  State<StatefulWidget> createState() => MainButtonState(i);
}

class MainButtonState extends State<MainButton> with TickerProviderStateMixin {
  final int i;
  MainButtonState(this.i);

  Animation _animation;
  GlobalKey _globalKey = GlobalKey();
  int soundDuration = 1;
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  String requiredSound;

  @override
  void initState() {
    super.initState();

    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    requiredSound = GetItemsFromAssetsState.avatars[i]
        .toString()
        .split("/")[1]
        .replaceAll("%20", " ");
    audioCache.load(requiredSound);
    _dealWithAsyncStuf();
  }

  void _dealWithAsyncStuf() async {
    Future<int> _getDuration() async {
      File audioFile = await audioCache.load(requiredSound);
      await advancedPlayer.setUrl(audioFile.path, isLocal: true);
      int duration = await Future.delayed(
          Duration(seconds: 1), () => advancedPlayer.getDuration());
      return duration;
    }

    soundDuration = await _getDuration();
  }

  @override
  Widget build(BuildContext context) {
    // void AnimateButton() async{
    //   var controller = AnimationController(duration: Duration(milliseconds: await _getDuration()),vsync: this);

    //   _animation = Tween(begin: 0.0, end: 1.0).animate(controller)
    //   ..addListener((){
    //     setState((){

    //     })
    //   })
    // }

    try {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          GestureDetector(
            onLongPress: () {
              advancedPlayer.stop();
            },
            child: Container(
              child: Stack(
                children: <Widget>[
                  mainButtonDesign(),
                  buttonAdittionalOptionsButton(),
                ],
              ),
            ),
          ),
        ]);
    } catch (e) {
      return Container(
        child: Text("Eror"),
      );
    }
  }

  Widget buttonAdittionalOptionsButton() {
    return IconButton(
      icon: Icon(Icons.add_circle_outline),
      color: Color.fromARGB(255, 0, 173, 181),
      alignment: Alignment(-2, -2),
      onPressed: () {},
    );
  }

  Widget mainButtonDesign() {
    return RaisedButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        color: primaryColor,
        textColor: tertiaryColor,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        splashColor: Colors.blueAccent,
        onPressed: () async {
          print("Sound Duration $soundDuration");
          audioCache.play(requiredSound, volume: 2);
        },
        child: Container(
          alignment: Alignment(0, 0),
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 7,
          child: Text(
            requiredSound.split(".mp3")[0],
            maxLines: 2,
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
