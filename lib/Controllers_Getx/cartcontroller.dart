import 'dart:developer';

import 'package:akcsapp/Controllers_Getx/dashcontroller.dart';
import 'package:akcsapp/Models/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CArtControLler extends GetxController {
  var cartProducts = [].obs;
  Rx<double> Grandtotal = 0.0.obs;
  Dashcontroller dashcontroller = Get.put(Dashcontroller());

  addProduct(CartMOdel model) {
    var contain =
        cartProducts.where((element) => element.product_id == model.product_id);
    if (contain.isNotEmpty) {
      Get.snackbar('Alert', 'Item is Already in Your Cart',
          backgroundColor: Color.fromARGB(255, 239, 239, 239),
          colorText: Color.fromARGB(255, 0, 0, 0),
          icon: Icon(
            Icons.warning_amber_sharp,
            size: 35,
          ));
    } else {
      cartProducts.add(model);
    }

    Grandtotal = Grandtotal + double.parse(model.total.toString());

    // double.parse(model.qty.toString())
  }

  remove(int index) {
    Grandtotal = Grandtotal - cartProducts[index].total;
    cartProducts.removeAt(index);
    log(Grandtotal.toString());
  }

  increment(int index) async {
    cartProducts[index].qty = cartProducts[index].qty + 0.5;
    cartProducts[index].total = cartProducts[index].price;
    cartProducts[index].total =
        cartProducts[index].price * cartProducts[index].qty;
    log(cartProducts[index].price.toString());
    double temptot = cartProducts[index].price / 2;

    log(temptot.toString());
    Grandtotal = (Grandtotal + temptot);
    temptot = 0;
  }

  decrement(int index) async {
    cartProducts[index].qty = cartProducts[index].qty - 0.5;

    cartProducts[index].total =
        cartProducts[index].price * cartProducts[index].qty;
    double temptot = cartProducts[index].price / 2;
    Grandtotal = (Grandtotal - temptot);
    log(temptot.toString());
    temptot = 0;
  }
}
