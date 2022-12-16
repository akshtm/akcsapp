import 'dart:developer';

import 'package:akcsapp/aUth_sCreEn/loginscreen.dart';
import 'package:akcsapp/scReens/dashboard.dart';
import 'package:akcsapp/scReens/dashboard.dart';
import 'package:akcsapp/uSer_Data/constants.dart';
import 'package:akcsapp/main.dart';
import 'package:akcsapp/uSer_Data/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  String? user;

  @override
  void onInit() {
    animationInitilization();
    user = box.read('user');
    log(user.toString());
    // Future.delayed(const Duration(microseconds: 2000), () {
    //   log('inside the splash nav');
    //   Get.to(sample());
    //   // Get.to(MyHomePage());
    //   log('outside the splash nav');
    // });
    super.onInit();
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(microseconds: 1000000), () {
      log('inside the splash nav');
      if (user == 'true') {
        Get.offAll(() => dashboard());
      } else {
        Get.to(
          () => LoginScreen(),
        );
      }
    });
    // TODO: implement onReady
    super.onReady();
  }
}
