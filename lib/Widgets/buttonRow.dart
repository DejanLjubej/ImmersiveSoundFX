import 'package:flutter/material.dart';
import 'soundButton.dart';


//for displaying rows of standard sounds
Widget rowOfButtons(int i) {

  int bcz = i+1;
     
  return Row(
    children: <Widget>[
      tryoutButton(i),
      tryoutButton(bcz),

    ],
  );
}

//for displaying rows of custom sounds

Widget customSoundRow (int i) {

  int bcz = i+1;
     
  return Row(
    children: <Widget>[
      tryoutButton(i),
      tryoutButton(bcz),

    ],
  );
}