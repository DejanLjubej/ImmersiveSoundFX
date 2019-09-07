import 'package:flutter/material.dart';
import 'soundButton.dart';


Widget rowOfButtons(int i) {
  return Center(child: 
  Row(
    children: <Widget>[

      tryoutButton(i),
      tryoutButton(i+1),
  

    ],
  ),
  ); 
}