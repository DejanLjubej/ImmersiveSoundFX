import 'dart:io' as io;
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import '../assetManager/directoryGetFiles.dart';


class AppBody extends StatefulWidget {
  // final LocalFileSystem localFileSystem;

  // AppBody(localFileSystem)
  //     : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => new AppBodyState();
}

class AppBodyState extends State<AppBody> {
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = TextEditingController();
  io.Directory directory;
  String soundName = "";

  

 Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
  
  Future<String> createNameDialog(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Name your sound!"),
          
          content: TextField(controller: _controller,
          
          decoration: InputDecoration(
            
            
            hintText: 'Enter a custom name',
          ),
          
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 10,
              color: Colors.blueGrey,
              onPressed: (){
                
        
                Navigator.of(context).pop(_controller.text.toString());
                soundName = _controller.text;
              },
              child: Text("Start recording!"),
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child:  
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
          
          createNameDialog(context).then((onValue){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Sound saved as: " + onValue),));
            _start();
            timer();
          
        
        },);
          
        }),
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

  // _start() async {
    
  //   try {
  //     if (await AudioRecorder.hasPermissions) {
  //       await AudioRecorder.start();
  //       bool isRecording = await AudioRecorder.isRecording;

  //         final directory = await getApplicationDocumentsDirectory();
  //         io.Directory dir = io.Directory(directory.path+"flutter_assets");
  //  //lednikou način       
  //   //       var root = await getExternalStorageDirectory();
  //   // var path = root.path + "/Pictures";
  //   // io.Directory dir = new io.Directory(path);
          
  //         var files = await FileManager(root: dir).walk().toList();
  //         print(files.toString());
  //         _recording = new Recording(duration: new Duration(), path: dir.toString());
  //         _isRecording = isRecording;
   
  //     } else {
  //       Scaffold.of(context).showSnackBar(
  //           new SnackBar(content: new Text("You must accept permissions")));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
 _start() async {
    try {


      var applicationDocDir = await getApplicationDocumentsDirectory();
          print("Application Documents dir: " + applicationDocDir.path.contains("cu").toString());
      var appSupDir = await getApplicationSupportDirectory();
          print("Application Support dir: " + appSupDir.toString());
          var a = await getExternalStorageDirectory();
          print(a.path);
      var extStrDir = await getExternalStorageDirectory();
          print("External Sorage dir: " + extStrDir.toString());
      var libDir = await getLibraryDirectory();
          print("Library dir "+ libDir.toString());
      var tempDir =  getTemporaryDirectory();
          print("Temp dir "+ tempDir.toString());
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {

          io.Directory applDir = await getApplicationDocumentsDirectory();
          print(applDir.list());
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            io.Directory appDocDirectory = 
                await getApplicationDocumentsDirectory();
            path = appDocDirectory.path+ '/' + _controller.text;
            print(appDocDirectory.list().toString());
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
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

    try{
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
    
    }catch (e){
      print( e);
    }
  }
  
  _rename(recordingPath) async{
        if(soundName.contains("/")){
          soundName = "new Custom Sound";
        }        
        int rangeMax =recordingPath.length - recordingPath.split("/")[4].length;
        await io.File(recordingPath).rename(recordingPath.substring(0,rangeMax) + soundName +".mp3");
    
  }

}
