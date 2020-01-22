import 'package:flutter/material.dart';

import 'soundButton.dart';


//for displaying rows of standard sounds
Widget rowOfButtons(int i) {
  int bcz = i + 1;

      try {
  return Row(
    children: <Widget>[
        MainButton(i),
        MainButton(bcz),
        
      
      // tryoutButton(i),
      // tryoutButton(bcz),
    ],
    );
      } catch (e) {
        print("row"+e);
        return Container();
      }
}

