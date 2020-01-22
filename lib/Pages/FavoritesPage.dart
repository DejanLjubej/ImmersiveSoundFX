import 'package:flutter/material.dart';


class FavoritesPageState extends State<FavoritesPage>{

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Text("Your favorites"),
    );
  }
}


class FavoritesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FavoritesPageState();
}