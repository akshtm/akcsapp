import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers_Getx/Spash_Cntrllr.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 17, 119, 147),
      body: GetBuilder<SplashScreenViewModel>(
        init: SplashScreenViewModel(),
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 17, 119, 147),
                Color.fromARGB(255, 114, 180, 185)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            text: '_',
                            style: TextStyle(
                                color: Color.fromARGB(255, 216, 230, 21),
                                fontSize: controller.animation.value * 150),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'AK\n',
                              style: TextStyle(
                                color: Color.fromARGB(255, 248, 254, 255),
                                fontSize: controller.animation.value * 150,
                              )),
                          TextSpan(
                              text: '               AREEKODE CHIKKEN STALL\n ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 216, 223, 14),
                                fontSize: controller.animation.value * 15,
                              )),
                          TextSpan(
                              text: 'CS ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 216, 223, 14),
                                fontSize: controller.animation.value * 150,
                              ))
                        ])),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
