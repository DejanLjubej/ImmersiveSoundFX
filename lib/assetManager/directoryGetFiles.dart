import 'dart:convert';
import 'package:flutter/material.dart';

class GetItemsFromAssets extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => GetItemsFromAssetsState();
}

class GetItemsFromAssetsState extends State<GetItemsFromAssets> {

  static var avatars;

  @override
  Widget build(BuildContext context) {

    initAvatars(context);
    return Scaffold();
  }
 
  initAvatars(initContext) async {
    final manifestContent =
        await DefaultAssetBundle.of(initContext).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = await json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('assets'))
        .where((String key) => key.contains('.mp3'))
        .toList();
    avatars=imagePaths;
      return imagePaths;
  }

  Future numberOfAssets() async{
    int numberOfAssets = await initAvatars(context);
    return numberOfAssets;
  }
  
}
