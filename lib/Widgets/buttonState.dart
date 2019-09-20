import 'dart:async';

import 'dart:convert';

import 'dart:ui';
import 'package:temp/assetManager/listOfSounds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'buttonRow.dart';

import 'package:audio_recorder/audio_recorder.dart';
import 'dart:math';
import 'package:file/file.dart';
import 'package:file/local.dart';

import '../assetManager/listOfSounds.dart';
import '../assetManager/directoryGetFiles.dart';
import 'voiceRecorder.dart';

const kMinScrollBarHeight = 20.0;
double _bcz = soundList.length / 2.round();
final int _number = _bcz.toInt();

class ButtonListDisplay extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  ButtonListDisplay({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => ExampleAppState();
  
}


class ExampleAppState extends State<ButtonListDisplay> {
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();

  static var mainSounds;

  String localFilePath;
  double _height = 50;
  int _i = -1;

  bool _isExpanded = false;
  IconData _arrow = Icons.arrow_drop_up;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: _height,
            width: 1000,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0), bottom: Radius.circular(3)),
                color: Colors.blueGrey,
                border: Border.all(
                  color: Colors.black,
                )),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: RaisedButton(
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
                              child: Icon(_arrow)),
                          onPressed: () {
                            //initAvatars();
                            //GetItemsFromAssets();
                            //GetItemsFromAssetsState.avatars.toString();
                            setState (() {
                              //this _i really shuldn't be here
                              _i = -1;

                              if (_isExpanded != true) {
                                _height = 450;
                                _isExpanded = true;
                                _arrow = Icons.arrow_drop_down;
                              } else {
                                _height = 50;
                                _isExpanded = false;
                                _arrow = Icons.arrow_drop_up;
                              }
                            });
                          },
                        )),
                  ],
                ),
                AppBody(localFilePath),
                
              ],
            ),
          )
        ],
      ),
    );
  }
    initAvatars() async {
          // >> To get paths you need these 2 lines
          final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

          final Map<String, dynamic> manifestMap = json.decode(manifestContent);
          // >> To get paths you need these 2 lines

          final soundPaths = manifestMap.keys
              .where((String key) => key.contains('assets'))
              .where((String key) => key.contains('.mp3'))
              .toList();
              print(soundPaths.toString());

          setState(() {
            mainSounds = soundPaths;
            print(mainSounds[1].toString().split('/')[1]);
          });
  }

  Widget recordButton() {
    return RaisedButton(
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
            child: Icon(Icons.record_voice_over)),
        onPressed: () {
          _start();
          timer();
        });
  }
  timer() {
    Timer(Duration(seconds: 5), () {
      _stop();
    });
  }

  _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        await AudioRecorder.start();
        bool isRecording = await AudioRecorder.isRecording;
        setState(() {
          _recording = new Recording(duration: new Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    File file = widget.localFileSystem.file(recording.path);
    print("  File length: ${await file.length()}");
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
    customSounds.add(recording.path);
    print(customSounds);
  }


  //widget responsible for displaying the list of sounds
  Widget buttonList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _number,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          _i += 1;

          return customSoundRow(_i);
        });
  }
}

