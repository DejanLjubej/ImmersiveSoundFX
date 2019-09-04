import 'package:flutter/material.dart';

int _number = 7;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  
  Widget build (BuildContext context){
    
    return MaterialApp(
      title: 'Situational Sound Effects',
      home: ButtonListDisply(),
     
    );
  }

    
}

class ButtonListDisply extends StatelessWidget{

 final List<FlatButton> btoon = [];
  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Situational Sound Effects'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _number,
            itemBuilder: (BuildContext context, int index){
              return tryoutButton();
            }
          ),
        ), 
         floatingActionButton: FloatingActionButton(
      onPressed: () {
        _number ++;
      },
      child: Icon(Icons.mic),
      backgroundColor: Colors.pink,
    ),
      );
  }


Widget tryoutButton(){
    return  RaisedButton(
     
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        /*...*/
      },
      child: Text(
        "Sound Name/Icon",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }


    Widget btn(){
      return ListView(
        children: <Widget>[
          tryoutButton(),
          tryoutButton(),
          tryoutButton(),
          tryoutButton(),
        ],
      );
    }
}