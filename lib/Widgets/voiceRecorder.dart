import 'dart:io' as io;
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

import '../Functionalities/customSoundPlayer.dart';
class RecordButton extends StatefulWidget {
 
  // final LocalFileSystem localFileSystem;

  // AppBody(localFileSystem)
  //     : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => new RecordButtonState();
}



class RecordButtonState extends State<RecordButton> {
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();

  //   return directory.path;
  // }
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = TextEditingController();
  io.Directory directory;
  String soundName = "";
  bool disabled = true;

    recordButton(BuildContext context, int i) async{
      // print("kuk je ta i da me tak jebe pm oipfpafjaosf"+i.toString());
      if (i<1){
        disabled=false;
      }
      return
      // Expanded(
      //flex: 1,
      //child:
      Row(
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
              child: Icon(Icons.record_voice_over)),
              
          onPressed: !disabled ? (){
           createNameDialog(context).then(
                (onValue) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Sound saved as: " + onValue),
                  ));
                  FutureBuilder(
                    future: 
                  _start(),
                  builder: (context, snap){
                    return snap.data;
                  },
                  );
                  timer();
                },
              );
          }: null,
        
          ),
      ],
      ); 
    //);
    }

  Future<String> createNameDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Name your sound!"),
            content: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a custom name',
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 10,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pop(_controller.text.toString());
                  soundName = _controller.text;
                },
                child: Text("Start recording!"),
              )
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child:Row(
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
              child: Icon(Icons.record_voice_over)),
          onPressed: () {
            createNameDialog(context).then(
              (onValue) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Sound saved as: " + onValue),
                ));
                _start();
                timer();
              },
            );
          }),
      ],) 
    );

//     null;
// Widget recordButton() {
//   }
  }

  timer() {
    Timer(Duration(seconds: 5), () {
      _stop();
    });
  }

// _manageSoundDirectory()async{
//   var root = await getExternalStorageDirectory();
//     var path = root.path + "/Pictures";
//     directory = new io.Directory(path);
// }

  _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        bool isRecording = await AudioRecorder.isRecording;

        var root = await getExternalStorageDirectory();
        var path = root.path + "/Sounds";
        io.Directory dir = new io.Directory(path);
        

        _recording = new Recording(duration: new Duration(), path: "");
        _isRecording = isRecording;
        await AudioRecorder.start(
            path:  dir.path + "/",
            audioOutputFormat: AudioOutputFormat.AAC);
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }
  _stop() async {
    try {
      var recording = await AudioRecorder.stop();

      print("Stop recording: ${recording.path}");
      bool isRecording = await AudioRecorder.isRecording;
      // File file = widget.localFileSystem.file(recording.path);
      // print("  File length: ${await file.length()}");
      _recording = recording;
      _isRecording = isRecording;
      //_controller.text = recording.path;

      // int rangeMax = recording.path.length - recording.path.split("/")[4].length;
      // await io.File(recording.path).rename(recording.path.substring(0,rangeMax) + "thname.mp3");
      //print(recording.path.split("/")[4].length);

      await _rename(recording.path);
    } catch (e) {
      print(e);
    }
  }

  _rename(recordingPath) async {
    if (soundName.contains("/")) {
      soundName = "new Custom Sound";
    }

    int recordingPathLength = recordingPath.length;
    int lastStringInPath = recordingPath.split("/").length - 1;
    int lastStringLengthForSubstraction =
        recordingPath.split("/")[lastStringInPath].length;

    int rangeMax = recordingPathLength - lastStringLengthForSubstraction;

    await io.File(recordingPath)
        .rename(recordingPath.substring(0, rangeMax) + soundName + ".mp3");
      await PlayCustomSoundState().getRecordedSounds();
  }
//  _start() async {
//     try {

//       var applicationDocDir = await getApplicationDocumentsDirectory();
//           print("Application Documents dir: " + applicationDocDir.path.contains("cu").toString());
//       var appSupDir = await getApplicationSupportDirectory();
//           print("Application Support dir: " + appSupDir.toString());
//       var extStrDir = await getExternalStorageDirectory();
//           print("External Sorage dir: " + extStrDir.toString());
//       var libDir = await getLibraryDirectory();
//           print("Library dir "+ libDir.toString());
//       var tempDir =  getTemporaryDirectory();
//           print("Temp dir "+ tempDir.toString());
//       if (await AudioRecorder.hasPermissions) {
//         if (_controller.text != null && _controller.text != "") {
//           String path = _controller.text;
//           if (!_controller.text.contains('/')) {
//             io.Directory appDocDirectory =
//                 await getApplicationDocumentsDirectory();
//             path = appDocDirectory.path+"/CustomSounds" + '/' + _controller.text;
//           }
//           print("Start recording: $path");

//           await AudioRecorder.start(
//               path: path, audioOutputFormat: AudioOutputFormat.AAC);
//         } else {
//           await AudioRecorder.start();
//         }
//         bool isRecording = await AudioRecorder.isRecording;
//         setState(() {
//           _recording = new Recording(duration: new Duration(), path: "");
//           _isRecording = isRecording;
//         });
//       } else {
//         Scaffold.of(context).showSnackBar(
//             new SnackBar(content: new Text("You must accept permissions")));
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}
