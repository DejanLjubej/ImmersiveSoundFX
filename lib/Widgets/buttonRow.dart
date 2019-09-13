import 'package:flutter/material.dart';
import 'package:temp/assetManager/listOfSounds.dart';
import 'soundButton.dart';

Widget rowOfButtons(int i) {

  int bcz = i+1;
     
  return Row(
    children: <Widget>[
      tryoutButton(i),
      tryoutButton(bcz),

    ],
  );
}
