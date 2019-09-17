import 'package:flutter/material.dart';
import 'Widgets/buttonState.dart';
import 'dart:ui';
import 'package:temp/assetManager/listOfSounds.dart';
import 'package:flutter/rendering.dart';
import 'Widgets/buttonRow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Situational Sound Effects',
      home: Avs(),
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.blue[50],
        primaryColor: Colors.blueGrey[700],
        accentColor: Colors.amber,
      ),
    );
  }
}

final double _bcz = soundList.length / 2.round();
final int _number = _bcz.toInt();
int _i = -2;

class Avs extends StatelessWidget {
  @override
  //noSuchMethod(Invocation i) => super.noSuchMethod(i);

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
            ButtonListDisplay(),
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
