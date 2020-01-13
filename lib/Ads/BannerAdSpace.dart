import 'package:flutter/material.dart';
import 'bannerAdState.dart';
class BannerSpace extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return DisplayBanner(); Expanded(
    //flex: (MediaQuery.of(context).size.height*0.1).floor(),
    
    child: 
     Container(
      child: DisplayBanner(),)
    );
    
    
  }
}