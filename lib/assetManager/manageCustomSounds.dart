import 'package:path_provider/path_provider.dart';

import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';

  var root;
  var path;
  var dir;
  String localFilePath;
  var files;
  var first;

getRecordedSounds(int i) async{
    root = await getExternalStorageDirectory();
    path = root.path + "/Sounds";
    new Directory(path).create(recursive: false);
    dir = Directory(path);
    //localFilePath = Directory(path).toString();
    //print("a1"+ localFilePath+"  asdfadfasd   " + root.toString() +"   sadfasdf  "+ await path + " asdfas" + files.toString());
    files = await FileManager(root: dir).walk().toList();
    if (files.length != 0){
      first = await files[i].path;
  //print("wadabavtnav" + first.path);
    }else{
      first = "";
    }
    localFilePath = first.toString();
    return  first;

  }

  getListOfItems() async{
    files = await FileManager(root: dir).walk().toList();
    print(files);
    return files;
  }