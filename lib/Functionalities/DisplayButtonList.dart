import 'package:flutter/material.dart';
import '../assetManager/directoryGetFiles.dart';
import '../Widgets/soundButton.dart';

int _number = 40;

class DisplayButtonListState extends State<DisplayButtonList>{

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: GetItemsFromAssetsState().initAvatars(context),
      builder: (context, snap) {
        try {
          _number = GetItemsFromAssetsState.avatars.length;
        } catch (e) {
          print(e);
        }
        if (snap.data == null) {
          return Container();
        } else {
          return GridView.count(
            padding: EdgeInsets.all(10),
            childAspectRatio: 2,
            shrinkWrap: true,
            crossAxisSpacing: 1,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: List.generate(_number, (index) {
              return MainButton(index);
            }),
          );
        }
      },
    );
  }
}
class DisplayButtonList extends StatefulWidget{

  @override

  DisplayButtonListState createState() => DisplayButtonListState();
}