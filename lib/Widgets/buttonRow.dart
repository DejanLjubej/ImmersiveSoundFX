import 'package:flutter/material.dart';
import 'package:temp/Functionalities/customSoundPlayer.dart';
import 'soundButton.dart';
import 'voiceRecorder.dart';
import '../assetManager/manageCustomSounds.dart';

//for displaying rows of standard sounds
Widget rowOfButtons(int i) {
  int bcz = i + 1;

  return Row(
    children: <Widget>[
      tryoutButton(i),
      tryoutButton(bcz),
    ],
  );
}


//for displaying rows of custom sounds
bool firstIsntNull ;
bool secondIsntNull;
customSoundRow(int i, BuildContext context) async {
  int bcz = i + 1;
  var first = await getRecordedSounds(i);
  var second = await getRecordedSounds(bcz);
  print("do I even get here");
  print(second.toString() + first.toString() + "what even");
  if (await first == null || first == "") {
    firstIsntNull = false;
  }else{
    firstIsntNull = true;
  }
  if (await second == null || second == "") {
    secondIsntNull = false;
    print("Am I in heteeeeeeeeeeeeeeeeeeeeeeeee!!!!!!!!!!!!!!");
  }else{
    secondIsntNull = false;
  }
  
      return
      
         FutureBuilder( 
           future: 
          firstIsntNull == false
            ? 
           RecordButtonState().recordButton(context, i)
                    : PlayCustomSoundState().playCustomSound(i),
         builder: (context, snap){
           print("what's the data od this thing " + snap.data.toString());
         return 
          snap.data;
        //  Flexible(flex: 1, 
        //  child:
        //  );
         
           //return snap.data;
         },
         );
          // Row(
          //   children: <Widget>[
          //     firstIsntNull
          //         ? RecordButtonState().recordButton(context, i)
          //         : PlayCustomSoundState().playCustomSound(i),
          //     secondIsntNull
          //         ? RecordButtonState().recordButton(context, bcz)
          //         : PlayCustomSoundState().playCustomSound(bcz),
          //   ],
          // );
}
  //   switch(first){
  //     case null:
  //     return null;
  //     default:
  //     return null;
  //   }

  // return FutureBuilder(
  //   builder: (context, snap) {
  //   },
  // );
  // print(first.toString() +
  //     "fiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiirst");