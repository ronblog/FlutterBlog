import 'package:flutter/material.dart';

class MoveableStackItem extends StatefulWidget {
  MoveableStackItem(String name, double x,double y)
  {
    xPosition = x;
    yPosition = y;
    roleName = name;
    print("Create '$name'");
  }
  double xPosition = 0;
  double yPosition = 0;
  String roleName = "";
  @override
  _MoveableStackItemState createState() => _MoveableStackItemState(xPosition,yPosition);
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  double xPosition = 0;
  double yPosition = 0;
  Color color = Colors.orange;
  List<bool> _selections = List.generate(2, (_) => false);

  _MoveableStackItemState(double x, double y)
  {
    xPosition = x;
    yPosition = y;
  }

  @override
  void initState() {
    //color = RandomColor().randomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
        onPanUpdate: (tapInfo) {
          setState(() {
            xPosition += tapInfo.delta.dx;
            yPosition += tapInfo.delta.dy;
          });
        },
        child: Container(
            width: 200,
            height: 30,
          padding: const EdgeInsets.all(3.0),
            color: Colors.brown[400],
            child: Row(
              children: [
                Text(widget.roleName, style:TextStyle(color: Colors.blue.withOpacity(1.0),fontSize: 20),textAlign: TextAlign.center,),
                Spacer(), //make space between text and buttons;

                ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.cancel,color: Colors.red[200] ),
                    Icon(Icons.bloodtype_sharp,color: Colors.red[200],),
                    // Icon(Icons.add_location),
                  ],
                  isSelected: _selections,
                  onPressed: (int index) async {
                    //await flutterTts.awaitSpeakCompletion(true);
                    //await flutterTts.speak(widget.playName);
                    setState(() {
                      _selections[index] = !_selections[index];
                    });
                  },
                ),
                //     IconButton(
                //       icon: new Icon(Icons.search),
                //       highlightColor: Colors.pink,
                //       onPressed: () async { print("message");
                //       //-----------------------
                //
                // await flutterTts.awaitSpeakCompletion(true);
                // await flutterTts.speak(widget.playName);
                //
                //         //------------------------------
                //       },
                //     )
              ],
            ),
        ),
      ),
    );
  }
}