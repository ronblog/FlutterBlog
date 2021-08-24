import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'playmodel.dart';
import 'moveitem.dart';
import 'playerwidget.dart';
import 'dart:async';


import 'package:flutter_tts/flutter_tts.dart';
enum TtsState { playing, stopped, paused, continued }
class PlayNormalView extends StatefulWidget {
  @override
  _PlayNormalViewState createState() => _PlayNormalViewState();
}

class _PlayNormalViewState extends State<PlayNormalView> { //with AutomaticKeepAliveClientMixin
  List<Widget> movableItems = [];


  final List<int> colorCodes = <int>[600, 500, 100];
  late PlayModel model;
  List<bool> _selections = List.generate(3, (_) => false);
  List<bool> _selections4 = List.generate(4, (_) => false);
  //tts
  late FlutterTts flutterTts;

  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() async {
    flutterTts = FlutterTts();


    _getDefaultEngine();


    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");

      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");

      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");

      });
    });



    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");

      });
    });

    double volume = 0.5;
    double pitch = 1.0;
    double rate = 0.5;
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
  }



  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }



  @override
  Widget build(BuildContext context) {

    print("===build-----");
    List<String> players = Provider.of<PlayModel>(context, listen: false).players;
    List<String> roles = Provider.of<PlayModel>(context, listen: false).roles;
    model = Provider.of<PlayModel>(context, listen: false);
    model.addListener(() { setState(() {

    });});

    return Scaffold(
        body: Column(
          children: [
            Expanded(flex: 9, // 20%
           child:  Row(
             children:  <Widget>[
               Expanded(
                   flex: 2, // 20%
                   child:ListView.separated(
                     padding: const EdgeInsets.all(8),
                     itemCount: roles.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Container(
                         height: 50,
                         color: Colors.amber[50],
                         //child: Center(child: PlayerWidget( "${players[index]}")),
                         child:  Text("${players[index]}", style:TextStyle(color: Colors.blue.withOpacity(1.0),fontSize: 20),textAlign: TextAlign.center,),
                       );
                     },
                     separatorBuilder: (BuildContext context, int index) => const Divider(),
                   )
               ),

               Expanded(
                 flex:8, // 20%
                 child: Stack(
                   children: List<MoveableStackItem>.generate(roles.length, (index) => MoveableStackItem(roles[index],500,110+35.0*index)),
                 ),
               ),


             ],
           )
            ),
            Expanded(
                flex:1, // 20%
                child:
                Row(
                  children: [
                    IconButton(
                      icon: new Icon(Icons.wb_sunny,color: Colors.pink,),
                      highlightColor: Colors.pink,
                      onPressed: () async { print("message");
                        //-----------------------
                      await flutterTts.awaitSpeakCompletion(true);
                      await flutterTts.speak("天亮请挣眼。");
                        //------------------------------
                      },
                    ),
                    IconButton(
                      icon: new Icon(Icons.bedtime,color: Colors.grey),
                      highlightColor: Colors.pink,
                      onPressed: () async { print("message");
                        //-----------------------
                      await flutterTts.awaitSpeakCompletion(true);

                      await flutterTts.speak("天黑请闭眼。");
                        //------------------------------
                      },
                    ),
                    Container(
                      width: 1,
                      height: double.maxFinite,
                      color: Colors.grey,
                    ),

                    ToggleButtons(
                      children: <Widget>[
                        Icon(Icons.wb_sunny,color: Colors.pink, ),
                        Icon(Icons.bloodtype_sharp,color: Colors.red[200]),
                         Icon(Icons.bedtime,color: Colors.grey),
                      ],
                      isSelected: _selections,
                      onPressed: (int index) async {
                        await flutterTts.awaitSpeakCompletion(true);
                        if (index==0)
                          await flutterTts.speak("狼人请挣眼。");
                        else if  (index==1)
                          await flutterTts.speak("狼人请杀人。");
                        else
                          await flutterTts.speak("狼人请闭眼。");
                      },
                    ),
                    Container(
                      width: 1,
                      height: double.maxFinite,
                      color: Colors.grey,
                    ),
                    ToggleButtons(
                      children: <Widget>[
                        Icon(Icons.wb_sunny,color: Colors.pink, ),
                        Icon(Icons.child_care_rounded,color: Colors.red[200]),
                        Icon(Icons.bedtime,color: Colors.grey),
                      ],
                      isSelected: _selections,
                      onPressed: (int index) async {
                        await flutterTts.awaitSpeakCompletion(true);
                        if (index==0)
                          await flutterTts.speak("预言家请挣眼。");
                        else if  (index==1)
                        await flutterTts.speak("预言家请验人。");
                        else
                        await flutterTts.speak("预言家请闭眼。");
                      },
                    ),
                    Container(
                      width: 1,
                      height: double.maxFinite,
                      color: Colors.grey,
                    ),
                    ToggleButtons(
                      children: <Widget>[
                        Icon(Icons.wb_sunny, color: Colors.pink,),
                        Icon(Icons.colorize_outlined,color: Colors.red[200] ),
                        Icon(Icons.create_sharp ,color: Colors.red[200] ),
                        Icon(Icons.bedtime,color: Colors.grey),
                      ],
                      isSelected: _selections4,
                      onPressed: (int index) async {
                        await flutterTts.awaitSpeakCompletion(true);
                        if (index==0)
                          await flutterTts.speak("女巫请挣眼。");
                        else if  (index==1)
                          await flutterTts.speak("女巫,你有一瓶解药，他死了， 你要救他吗？");
                        else if  (index==2)
                          await flutterTts.speak("女巫,你有一瓶毒药，你要用吗？");
                        else
                          await flutterTts.speak("女巫请闭眼。");
                      },
                    ),
                  ],
                )
            ),
          ],
        )


    );
  }

  //@override
  // TODO: implement wantKeepAlive
  //bool get wantKeepAlive => true;
}

