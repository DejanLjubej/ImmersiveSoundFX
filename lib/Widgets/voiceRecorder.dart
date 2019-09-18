import 'dart:io' as io;
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import '../assetManager/listOfSounds.dart';
import '../assetManager/directoryGetFiles.dart';



class AppBody extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  AppBody({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => new AppBodyState();
}

class AppBodyState extends State<AppBody> {
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return null;
    
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
  
}
