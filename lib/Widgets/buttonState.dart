
import 'package:flutter/material.dart';
import 'buttonRow.dart';

class ButtonListDisplay extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ButtonListDisplay> {
  String localFilePath;

  @override
  Widget build(BuildContext context) {
    int _i = -2;
    int _number = 50;

    return Scaffold(
      appBar: AppBar(
        title: Text('Situational Sound Effects'),
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 1000,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _number,
                            itemBuilder: (BuildContext context, int index) {
                              _i += 2;
                              return rowOfButtons(_i);
                            }),
                      ),
                    ],
                  ),
                )),
            Flexible(
                flex: 1,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _number,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              _i += 2;
                              return rowOfButtons(_i);
                            }),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
