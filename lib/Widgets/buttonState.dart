import 'dart:ui';
import 'package:temp/assetManager/listOfSounds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'buttonRow.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:temp/main.dart';
import 'dart:math';
import 'dart:io';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'voiceRecorder.dart';

const kMinScrollBarHeight = 20.0;
double _bcz = soundList.length / 2.round();
final int _number = _bcz.toInt();

class ButtonListDisplay extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ButtonListDisplay> {
  
  
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
            width: 500,
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
                            setState(() {
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
                recordButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  //widget responsible for displaying the list of sounds
  Widget buttonList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _number,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          _i += 1;

          return rowOfButtons(_i);
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
            
        });
  }
}

// Start recording











// comented code that might be usefull at some poin
// Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   mainAxisAlignment: MainAxisAlignment.center,
//   mainAxisSize: MainAxisSize.max,
//   children: <Widget>[
//     Expanded(
//         flex: 3,
//         child: Container(
//           height: 100,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: buttonList(),
//               ),
//             ],
//           ),
//         )),
//     Flexible(
//         flex: 2,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.end,
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[

//             Container(
//               height: _height,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                 color: Colors.black,
//                 width: 1,
//               )),
//               child: Column(
//                 children: <Widget>[
//                   Flexible(
//               child: RaisedButton(onPressed: () {
//               setState(() {
//                 _height += 60;
//               });
//             })),
//                   Expanded(
//                     flex: 1,
//                     child: buttonList(),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         )),
//   ],
// ),
