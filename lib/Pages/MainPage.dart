import 'package:ImmersiveSoundFX/Ads/bannerAdState.dart';
import 'package:flutter/material.dart';
import 'FavoritesPage.dart';
import '../Functionalities/DisplayButtonList.dart';



class MainPage extends StatefulWidget{
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage>{

   @override
  Widget build(BuildContext context) {
  int flexOfPage = (MediaQuery.of(context).size.height * 0.9).toInt();
    return Scaffold(
      appBar: AppBar(
        title:Text('Immersive sound FX',
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 25,
          fontFamily: "Open Sans",
          fontWeight: FontWeight.bold,
          ),
        ), 
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(context, 
                new MaterialPageRoute(
                  builder: (context) => new FavoritesPage()
                )
              );
            },
          )
        ],
      ),
      
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: flexOfPage,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: flexOfPage,
                              child: DisplayButtonList(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
            DisplayBanner(),
          ],
        ),
      ),
    );
  }
}
