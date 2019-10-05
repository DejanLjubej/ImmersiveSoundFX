import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

import 'dart:async';

import 'package:path_provider/path_provider.dart';

import 'package:flutter_file_manager/flutter_file_manager.dart';

class PlayCustomSound extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PlayCustomSoundState();
}

enum PlayerState { stopped, playing, paused }
typedef void OnError(Exception exception);
const kUrl =
    "/storage/emulated/0/Android/data/com.example.temp/files/Sounds/fjg.mp3";

class PlayCustomSoundState extends State<PlayCustomSound> {
  Duration duration;
  Duration position;

  AudioPlayer audioPlayer;

  String localFilePath;
  var root;
  var path;
  var dir;
  var files;
  var first;
  int i = 0;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

  @override
  void initState(){
    super.initState();
    initAudioPlayer();
    getRecordedSounds(i);
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void initAudioPlayer() {
    audioPlayer = new AudioPlayer();
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
      if (s == AudioPlayerState.PLAYING) {
        setState(() => duration = audioPlayer.duration);
      } else if (s == AudioPlayerState.STOPPED) {
        onComplete();
        setState(() {
          position = duration;
        });
      }
    }, onError: (msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = new Duration(seconds: 0);
        position = new Duration(seconds: 0);
      });
    });
  }

  getRecordedSounds(int i) async {
    print(i);
    root = await getExternalStorageDirectory();
    path = root.path + "/Sounds";
    new Directory(path).create(recursive: false);

    dir = Directory(path);
    //localFilePath = Directory(path).toString();
    files = await FileManager(root: dir).walk().toList();
    if(files.length != 0){
      first = files[i];
    }else{
      first="";
    }

    localFilePath = first.toString();
    return localFilePath;
    // print("localfilepath " +
    //     localFilePath +
    //     "  root strnig   " +
    //     root.toString() +
    //     "   path  " +
    //     path +
    //     " all files" +
    //     files.toString());
  }

  getListOfItems() async {
    files = await FileManager(root: dir).walk().toList();
    print(files);
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  Future play() async {
    await audioPlayer.play(kUrl);
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future _playLocal(n) async {
    //await getRecordedSounds(n);
    print("is _playLocal the issue?");
    print(n);
    audioPlayer = new AudioPlayer();
    await audioPlayer.play(n, isLocal: true);
    setState(() => playerState = PlayerState.playing);
    //print(files[n].path.toString());
    //print("am I here " + files[n].path.toString());
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = new Duration();
    });
  }

  Future mute(bool muted) async {
    await audioPlayer.mute(muted);
    setState(() {
      isMuted = muted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(width: 0.0, height: 0.0);
  }

  playCustomSound(n) async{
    return 
    //Expanded(child: 
     FutureBuilder(
       future: getRecordedSounds(n),
      builder: (context, snap) {
        return Row(children: <Widget>[

         Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton(
                  
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    color: Colors.deepPurple[900],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(1.0),
                    splashColor: Colors.blueAccent,
                    child: Container(
                        height: 20,
                        width: 150,
                        margin: const EdgeInsets.all(1),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.surround_sound),
                            //Text(localFilePath.split(".mp3")[0])
                          ],
                        )),
                    onPressed: () {
                      _playLocal(snap.data);
                      print(n);
                    }),
              ],
            ))
        ],);
      },
    );
    // ,
    // flex: 1,
    // );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return new Center(
//         child: new Material(
//             elevation: 2.0,
//             color: Colors.grey[200],
//             child: new Center(
//               child: new Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     new Material(child: _buildPlayer()),
//                     localFilePath != null
//                         ? new Text(localFilePath)
//                         : new Container(),
//                     new Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: new Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [

//                             new RaisedButton(
//                               onPressed: () => _playLocal(),
//                               child: new Text('play local'),
//                             ),
//                           ]),
//                     )
//                   ]),
//             )));
//   }

//   Widget _buildPlayer() => new Container(
//       padding: new EdgeInsets.all(16.0),
//       child: new Column(mainAxisSize: MainAxisSize.min, children: [
//         new Row(mainAxisSize: MainAxisSize.min, children: [
//           new IconButton(
//               onPressed: isPlaying ? null : () => play(),
//               iconSize: 64.0,
//               icon: new Icon(Icons.play_arrow),
//               color: Colors.cyan),
//           new IconButton(
//               onPressed: isPlaying ? () => pause() : null,
//               iconSize: 64.0,
//               icon: new Icon(Icons.pause),
//               color: Colors.cyan),
//           new IconButton(
//               onPressed: isPlaying || isPaused ? () => stop() : null,
//               iconSize: 64.0,
//               icon: new Icon(Icons.stop),
//               color: Colors.cyan),
//         ]),
//         duration == null
//             ? new Container()
//             : new Slider(
//                 value: position?.inMilliseconds?.toDouble() ?? 0.0,
//                 onChanged: (double value) =>
//                     audioPlayer.seek((value / 1000).roundToDouble()),
//                 min: 0.0,
//                 max: duration.inMilliseconds.toDouble()),
//         new Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             new IconButton(
//                 onPressed: () => mute(true),
//                 icon: new Icon(Icons.headset_off),
//                 color: Colors.cyan),
//             new IconButton(
//                 onPressed: () => mute(false),
//                 icon: new Icon(Icons.headset),
//                 color: Colors.cyan),
//           ],
//         ),
//         new Row(mainAxisSize: MainAxisSize.min, children: [
//           new Padding(
//               padding: new EdgeInsets.all(12.0),
//               child: new Stack(children: [
//                 new CircularProgressIndicator(
//                     value: 1.0,
//                     valueColor: new AlwaysStoppedAnimation(Colors.grey[300])),
//                 new CircularProgressIndicator(
//                   value: position != null && position.inMilliseconds > 0
//                       ? (position?.inMilliseconds?.toDouble() ?? 0.0) /
//                           (duration?.inMilliseconds?.toDouble() ?? 0.0)
//                       : 0.0,
//                   valueColor: new AlwaysStoppedAnimation(Colors.cyan),
//                   backgroundColor: Colors.yellow,
//                 ),
//               ])),
//           new Text(
//               position != null
//                   ? "${positionText ?? ''} / ${durationText ?? ''}"
//                   : duration != null ? durationText : '',
//               style: new TextStyle(fontSize: 24.0))
//         ])
//       ]));
