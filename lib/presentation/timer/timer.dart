import 'package:bit_connect/utils/constants/colorAssets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  double percent = 0;
  static int TimeInMinut = 25;
  int TimeinSec = TimeInMinut * 60;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [ColorAssets.bduColor, ColorAssets.secondaryColor],
                  begin: FractionalOffset(0.5, 1))),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Pomodoro Clock",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Container(
                width: 200,
                height: 300,
                child: CircularPercentIndicator(
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 100, // Place 250 here
                  lineWidth: 20,
                  progressColor: ColorAssets.white,
                  center: Text(
                    "$TimeInMinut",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: ColorAssets.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 30,left: 20,right: 20),
                          child: Column(
                            children: <Widget>[
                              Expanded(child: 
                              Row(
                                children: <Widget>[
                                  Expanded(child: Column(
                                    children: <Widget>[
                                      Text("Study Time",
                                      style:TextStyle(
                                        fontSize: 25,
                                      ) ,),
                                      SizedBox(height: 10,),
                                      Text("25",
                                      style: TextStyle(fontSize: 80),)
                                    ],
                                  )),
                                   Expanded(
                              child: Column(
                            children: <Widget>[
                              Text(
                                "Pause Time",
                                style: TextStyle(
                                  fontSize: 5,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "25",
                                style: TextStyle(fontSize: 80),
                              )
                            ],
                          ))
                                ],
                              )),
                              
                            ],
                          ),
                        ),
              )),

            ],
          ),
        ),
      )),
    );
  }
}
