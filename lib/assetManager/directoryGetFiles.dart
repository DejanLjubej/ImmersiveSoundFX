import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:file/local.dart';
import 'dart:convert';
import 'listOfSounds.dart';


class GetItemsFromAssets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GetItemsFromAssetsState();
}

 //var _avatars;

class GetItemsFromAssetsState extends State<GetItemsFromAssets> {
  static var avatars;
  @override
  Widget build(BuildContext context) {
    //print("hello");
    initAvatars(context);
    return Scaffold();
  }
  initAvatars(context) async {
    // >> To get paths you need these 2 lines
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('assets'))
        .where((String key) => key.contains('.mp3'))
        .toList();
        //print(imagePaths);

    setState(() {
      avatars = imagePaths;
      
    });
      //print(avatars[1]);
      

  }

  
}
