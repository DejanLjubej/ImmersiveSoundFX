import 'package:flutter/material.dart';
import 'Widgets/buttonState.dart';
import 'dart:ui';
import 'package:temp/assetManager/listOfSounds.dart';
import 'package:flutter/rendering.dart';
import 'Widgets/buttonRow.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'Widgets/voiceRecorder.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override  
  Widget build (BuildContext context){
    
    return MaterialApp(
      title: 'Situational Sound Effects',
      home:  Avs(),
      theme: ThemeData(
        brightness:     Brightness.light,
        canvasColor:    Colors.blue[50],
        primaryColor:   Colors.blueGrey[700],
        accentColor:    Colors.amber,
    ),
    );
    
  }
}


final double _bcz =soundList.length/2.round();
final int _number = _bcz.toInt();
class Avs extends StatelessWidget{
  @override
  noSuchMethod(Invocation i) => super.noSuchMethod(i);
  String localFilePath;
  double _height = 50;
  int _i = -2;
  double _scrollBarOffset = 0.0;

  bool _isExpanded = false;
  IconData _arrow = Icons.arrow_drop_up;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situational Sound Effects'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: buttonList(),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
            MyRecorder(),
          ],
        ),

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
          _i += 2;
          return rowOfButtons(_i);
        });
  }
}






  
  
