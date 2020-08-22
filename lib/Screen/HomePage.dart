import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ganpati_bappa/Data/constant.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isAarti = false;

  playLocal() async {
    try {
      int result = 
          await audioPlayer.play('images/mp3/Aarti.mp3', 
          isLocal: true,
          volume: 0.5,
          );
      print(result);
    } catch (e) {
      print(e.toString());
    }
  }
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                isAarti == false
                    ? Container()g
                    : Positioned(
                        left: 10.0,
                        right: 10.0,
                        top: 0.0,
                        child: Row(
                          children: [
                            Image.asset("images/bell.png",
                                height: size.height * 0.25),
                            Spacer(),
                            Image.asset("images/bell.png",
                                height: size.height * 0.25),
                          ],
                        ),
                      ),
                Align(
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: Duration(
                        seconds: 10,
                      ),
                      child: CircleAvatar(
                        radius: 120,
                        backgroundColor: Colors.blue.withOpacity(0.9),
                      ),
                    )),
                Align(
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: Duration(
                        seconds: 10,
                      ),
                      child: CircleAvatar(
                        radius: 150,
                        backgroundColor: Colors.blue.withOpacity(0.4),
                      ),
                    )),
                Align(
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: Duration(
                        seconds: 10,
                      ),
                      child: CircleAvatar(
                        radius: 180,
                        backgroundColor: Colors.blue.withOpacity(0.2),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50,
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Image(
                      height: MediaQuery.of(context).size.height * 0.6,
                      fit: BoxFit.fitHeight,
                      image: AssetImage("images/bappa.png"),
                         ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Draggable(
                    ignoringFeedbackSemantics: true,
                    childWhenDragging: Container(),
                    feedback: Container(
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Container(
                            child: Image.asset(
                          "images/poojaDish.png",
                          height: 200,
                          fit: BoxFit.cover,
                        )),
                      ),
                      height: 100,
                      width: 200,
                    ),
                    child: Container(
                        child: Image.asset(
                      "images/poojaDish.png",
                      height: 120,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                isAarti
                    ? TyperAnimatedTextKit(
                        speed: Duration(
                          milliseconds: 92,
                        ),
                        isRepeatingAnimation: true,
                        text: aartiText,
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "images/divya.png",
                      height: 60,
                    ),
                    Image.asset(
                      "images/flower1.png",
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isAarti) {
                            isAarti = false;
                          } else {
                            playLocal();
                            isAarti = true;
                          }
                        });
                      },
                      child: Image.asset(
                        "images/vedic.jpg",
                        height: 80,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Divya"),
                    Text("Offer Flowers"),
                    Text("Start Aarti"),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
