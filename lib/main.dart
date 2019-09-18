import 'package:flutter/material.dart';
import 'Widgets/buttonState.dart';
import 'dart:ui';
import 'package:temp/assetManager/listOfSounds.dart';
import 'package:flutter/rendering.dart';
import 'Widgets/buttonRow.dart';
import 'assetManager/directoryGetFiles.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  static var avatars;
  @override
  Widget build(BuildContext context) {
    initAvatars(context);
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
   initAvatars(c) async {
    // >> To get paths you need these 2 lines
    final manifestContent =
        await DefaultAssetBundle.of(c).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/avatars/'))
        .where((String key) => key.contains('.mp3'))
        .toList();
    print(imagePaths.toString() + "whtnw");

    
      avatars = imagePaths;
      print(avatars[1]);
      
    
  }
}



final double _bcz = soundList.length / 2.round();
final int _number = _bcz.toInt();

class Avs extends StatelessWidget {
  int _i = -2;
  @override
  //noSuchMethod(Invocation i) => super.noSuchMethod(i);
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


class GetItemsFromAssets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GetItemsFromAssetsState();
}

 //var _avatars;

class GetItemsFromAssetsState extends State<GetItemsFromAssets> {
  static var avatars;
  @override
  Widget build(BuildContext context) {
    print("hello");
    initAvatars(context);
    return Scaffold();
  }

  
  initAvatars(c) async {
    // >> To get paths you need these 2 lines
    final manifestContent =
        await DefaultAssetBundle.of(c).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/avatars/'))
        .where((String key) => key.contains('.mp3'))
        .toList();
    print(imagePaths.toString() + "whtnw");

    setState(() {
      avatars = imagePaths;
      print(avatars[1]);
      
    });
  }
}
