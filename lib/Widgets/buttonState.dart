import 'dart:async';

import 'dart:convert';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'buttonRow.dart';

import 'package:audio_recorder/audio_recorder.dart';
import 'dart:math';
import 'package:file/file.dart';
import 'package:file/local.dart';

import '../assetManager/directoryGetFiles.dart';
import 'voiceRecorder.dart';

import 'package:audioplayers/audio_cache.dart';
import '../Functionalities/customSoundPlayer.dart';

//import 'package:firebase_admob/firebase_admob.dart';

const kMinScrollBarHeight = 20.0;

final int _number = 100;

class ButtonListDisplay extends StatefulWidget {
  // final LocalFileSystem localFileSystem;

  // ButtonListDisplay({localFileSystem})
  //     : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => ExampleAppState();
}

class ExampleAppState extends State<ButtonListDisplay> {

// @override
// void initState(){
//   super.initState();
//   FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-3940256099942544~3347511713').then((response){
//     myBanner..load()..show();
//   });
// }
  
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();

  static var mainSounds;

  String localFilePath;
  double _height = 50;
  int _i=0;

  bool _isExpanded = false;
  IconData _arrow = Icons.arrow_drop_up;
  AudioCache audioCache = new AudioCache();

  @override
  
  Widget build(BuildContext context) {
    //FirebaseAdMob.instance.initialize(appId: "ca-app-pub-3940256099942544~3347511713");
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
                            setState(() {
                              //audioCache.play("/data/data/com.example.temp/app_flutter/onr.m4a");
                              //this _i really shuldn't be here
                              //_i = 1;

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
                // FutureBuilder(
                //   builder: (context, snap) {
                //     return
                //   },
                // )
                Expanded(
                  flex: 1,
                  child: 
                  buttonList(),
                ),
                //RecordButton(),
                //PlayCustomSound(),
              ],
            ),
          )
        ],
      ),
    );
  }

  // return FutureBuilder(
  //   builder: (context, snap) {
  //     // switch (snap.connectionState) {
  //     //   case ConnectionState.active:
  //     //   case ConnectionState.done:
  //     //   case ConnectionState.none:
  //     //   case ConnectionState.waiting:
  //     // }
  //   },
  // );
  buttonList() {
    int a=_i;
    return
    
    
    FutureBuilder(
      future: customSoundRow(a, context),
      builder: (context, snap) {
        switch (snap.connectionState) {
          case ConnectionState.active:
          case ConnectionState.none:
            return Text(
              'Press the button to fetch data',
              textAlign: TextAlign.center,
            );

          case ConnectionState.waiting:
            return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));
          case ConnectionState.done:
            if (snap.hasError)
              return Text(
                'Error:\n\n${snap.error}',
                textAlign: TextAlign.center,
              );
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  a += 1;
                  try{

                      print(snap.data.toString() +
                          " aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

                      return 
                      snap.data;
                  }catch(e){
                    return Container();
                  }
                //  customSoundRow(_i, context);
                }
            );
        }
        return Container();
      },
    ); 
  }

  //   initAvatars() async {
  //         // >> To get paths you need these 2 lines
  //         final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

  //         final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  //         // >> To get paths you need these 2 lines

  //         final soundPaths = manifestMap.keys
  //             .where((String key) => key.contains('assets'))
  //             .where((String key) => key.contains('.mp3'))
  //             .toList();
  //             print(soundPaths.toString());

  //         setState(() {
  //           mainSounds = soundPaths;
  //           print(mainSounds[1].toString().split('/')[1]);
  //         });
  // }

  // Widget recordButton() {
  //   return RaisedButton(
  //       shape: ContinuousRectangleBorder(
  //         borderRadius: BorderRadius.circular(20.0),
  //       ),
  //       elevation: 5,
  //       color: Colors.deepPurple[900],
  //       textColor: Colors.white,
  //       disabledColor: Colors.grey,
  //       disabledTextColor: Colors.black,
  //       padding: EdgeInsets.all(1.0),
  //       splashColor: Colors.blueAccent,
  //       child: Container(
  //           height: 20,
  //           width: 150,
  //           margin: const EdgeInsets.all(1),
  //           child: Icon(Icons.record_voice_over)),
  //       onPressed: () {
  //         _start();
  //         timer();
  //       });
  // }
  // timer() {
  //   Timer(Duration(seconds: 5), () {
  //     _stop();
  //   });
  // }

  // _start() async {
  //   try {
  //     if (await AudioRecorder.hasPermissions) {
  //       await AudioRecorder.start();
  //       bool isRecording = await AudioRecorder.isRecording;
  //       setState(() {
  //         _recording = new Recording(duration: new Duration(), path: "");
  //         _isRecording = isRecording;
  //       });
  //     } else {
  //       Scaffold.of(context).showSnackBar(
  //           new SnackBar(content: new Text("You must accept permissions")));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // _stop() async {
  //   var recording = await AudioRecorder.stop();
  //   print("Stop recording: ${recording.path}");
  //   bool isRecording = await AudioRecorder.isRecording;
  //   File file = widget.localFileSystem.file(recording.path);
  //   print("  File length: ${await file.length()}");
  //   setState(() {
  //     _recording = recording;
  //     _isRecording = isRecording;
  //   });
  //   _controller.text = recording.path;
  //   customSounds.add(recording.path);
  //   print(customSounds);
  // }

  //widget responsible for displaying the list of sounds

}
// MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//   keywords: <String>['flutterio', 'beautiful apps'],
//   contentUrl: 'https://flutter.io',
//   birthday: DateTime.now(),
//   childDirected: false,
//   designedForFamilies: false,
//   gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
//   testDevices: <String>[], // Android emulators are considered test devices
// );

// BannerAd myBanner = BannerAd(
//   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   // https://developers.google.com/admob/android/test-ads
//   // https://developers.google.com/admob/ios/test-ads
//   adUnitId: BannerAd.testAdUnitId,
//   size: AdSize.smartBanner,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("BannerAd event is $event");
//   },
// );