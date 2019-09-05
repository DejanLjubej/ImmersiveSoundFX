import 'package:flutter/material.dart';
import 'soundButton.dart';
import 'buttonRow.dart';

int _number = 7;
class ButtonListDisplay extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ButtonListDisplay> {
  
  String localFilePath;

  @override
  Widget build(BuildContext context) {
  int _index =-3;
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Situational Sound Effects'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _number,
            itemBuilder: (BuildContext context, int index){
              _index +=3;
              return rowOfButtons(_index);
            }
          ),
        ),
        // Center(
        //   child: ListView.builder(
        //     itemCount: _number,
        //     itemBuilder: (BuildContext context, int index){
        //       return tryoutButton(index);
        //     }
        //   ),
        // ), 
        
    );
        // GridView.count(
        //   // Create a grid with 2 columns. If you change the scrollDirection to
        //   // horizontal, this produces 2 rows.
        //   crossAxisCount: 2,
        //   // Generate 100 widgets that display their index in the List.
        //   children: List.generate(101, (index) {
        //     return Center(
        //       child: Text(
        //         'Item $index',
        //         style: Theme.of(context).textTheme.headline,
        //       ),
        //     );
        //   }),
        // ),  

    
  }
 

}