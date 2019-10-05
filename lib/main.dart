import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/buttonState.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'Widgets/buttonRow.dart';
import 'assetManager/directoryGetFiles.dart';
import 'dart:convert';
import 'Functionalities/createDirectoryForStorage.dart';
import 'Functionalities/customSoundPlayer.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'Ads/bannerAddState.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'situational sound effects',
      home: Avs(),
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Color.fromARGB(255, 244, 89, 5),
        primaryColor: Color.fromARGB(255, 251, 146, 36),
        //accentColor: Colors.amber,
      ),
    );
  }
}


final int _number = 50;


class Avs extends StatelessWidget {
  // static var avatars;
  int _i = -2;
  @override
  //noSuchMethod(Invocation i) => super.noSuchMethod(i);
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Situational Sound Effects'),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(5.0, 0, 5, 50),
        child: Stack(
          children: <Widget>[
            //GetItemsFromAssetsState(),
            //CreateDirectory(),
            //PlayCustomSound(),
            GetItemsFromAssets(),
            DisplayBanner(),

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
            //ButtonListDisplay(),
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
          try{

          return rowOfButtons(_i);
          }catch(e){
            return Container();
          }
        });
  }
}
