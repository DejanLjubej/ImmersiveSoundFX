import 'dart:ui';

import 'package:flutter/material.dart';
import 'buttonRow.dart';


const kMinScrollBarHeight = 20.0;
class ButtonListDisplay extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ButtonListDisplay> {
  String localFilePath;
  double _height = 150;
  int _i = -2;
  int _number = 50;
  double _scrollBarOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situational Sound Effects'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: buttonList(),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              
              children: <Widget>[
                Container(
                  height: _height,
                  
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.black,
                        
                      )),
                  child: Column(
                    
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _height += 60;
                            });
                      })),
                      Expanded(
                        flex: 3,
                        child: buttonList(),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),

      ),
    );
  }

  //widget responsible for displaying the list of sounds
  Widget buttonList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _number,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          _i += 2;
          return rowOfButtons(_i);
        });
  }
}

class MyDraggable extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    final Radius cornerRadius = Radius.circular(20.0);
    final double lineMargin = 30.0;

    // Draw slider
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(0.0, 0.0, size.width, size.height,
            bottomLeft: cornerRadius, bottomRight: cornerRadius),
        paint);
    paint.color = Colors.black.withAlpha(64);
    paint.strokeWidth = 1.5;

    // Draw triangle
    canvas.drawPoints(
      
        PointMode.polygon,
        [
          Offset((size.width / 2) - 5.0, size.height - 10.0),
          Offset((size.width / 2) + 5.0, size.height - 10.0),
          Offset((size.width / 2), size.height - 5.0),
          Offset((size.width / 2) - 5.0, size.height - 10.0),
        ],
        paint);

    // Draw line
    canvas.drawLine(Offset(lineMargin, size.height - kMinScrollBarHeight),
        Offset(size.width - lineMargin, size.height - kMinScrollBarHeight), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}



// comented code that might be usefull at some poin
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.max,
        //   children: <Widget>[
        //     Expanded(
        //         flex: 3,
        //         child: Container(
        //           height: 100,
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             mainAxisSize: MainAxisSize.max,
        //             children: <Widget>[
        //               Expanded(
        //                 flex: 2,
        //                 child: buttonList(),
        //               ),
        //             ],
        //           ),
        //         )),
        //     Flexible(
        //         flex: 2,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           mainAxisSize: MainAxisSize.max,
        //           children: <Widget>[

        //             Container(
        //               height: _height,
        //               decoration: BoxDecoration(
        //                   border: Border.all(
        //                 color: Colors.black,
        //                 width: 1,
        //               )),
        //               child: Column(
        //                 children: <Widget>[
        //                   Flexible(
        //               child: RaisedButton(onPressed: () {
        //               setState(() {
        //                 _height += 60;
        //               });
        //             })),
        //                   Expanded(
        //                     flex: 1,
        //                     child: buttonList(),
        //                   ),
        //                 ],
        //               ),
        //             )
        //           ],
        //         )),
        //   ],
        // ),