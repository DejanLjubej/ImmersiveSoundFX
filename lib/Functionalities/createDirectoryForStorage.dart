import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class CreateDirectory extends StatefulWidget {
  

  @override
  State<StatefulWidget> createState() => CreateDirectoryState();
  
}
var dir = new Directory("");

createDir() async {
  // baseDir = await getExternalStorageDirectory(); //only for Android
   Directory baseDir = await getApplicationDocumentsDirectory(); //works for both iOS and Android
  String dirToBeCreated = "/CustomSounds";
  String finalDir = join(baseDir.toString(), dirToBeCreated);
  dir = Directory(finalDir);
  bool dirExists = await dir.exists();
  if(!dirExists){
     dir.create(/*recursive=true*/); //pass recursive as true if directory is recursive
  }
  //Now you can use this directory for saving file, etc.
  //In case you are using external storage, make sure you have storage permissions.
}



class CreateDirectoryState extends State<CreateDirectory>{
    
    
    @override
    initState(){
      createDir(); //call your method here
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}