
import 'dart:ui';
import 'package:ImmersiveSoundFX/Styles/CollorPallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'Pages/MainPage.dart';
import 'Styles/CollorPallete.dart';
var colorOne= Color.fromARGB(255, 0, 173, 181);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Immersive sound FX',
      home: MainPage(),
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: secondaryColor,
        primaryColor: themeColor,
      ),
      
    );
  }
}



