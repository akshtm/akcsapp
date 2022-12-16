import 'dart:developer';

import 'package:akcsapp/Controllers_Getx/dashcontroller.dart';

import 'package:akcsapp/scReens/akcs/aKcsSreen.dart';
import 'package:akcsapp/scReens/farmDetails.dart';
import 'package:akcsapp/scReens/sMarket/grocery_store.dart';
import 'package:akcsapp/widgets/BottomNavigationbar.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:akcsapp/widgets/drawer/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class dashboard extends StatelessWidget {
  dashboard({Key? key}) : super(key: key);
  Dashcontroller dashcontrol = Get.put(Dashcontroller());
  var size, height, width;
  static ValueNotifier<int> SelectedIndexNotifier = ValueNotifier(0);
  final pages = [
    AKcsScreen(),
    Grocery_stores()
    // MyHomePage()
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      bottomNavigationBar: const AKCSBottomNavigationbar(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), child: appbarakcs()),
      drawer: drawer(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: SelectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, _) {
          return pages[updatedIndex];
        },
      )),
    );
  }
}
