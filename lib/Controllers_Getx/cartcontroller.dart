import 'dart:developer';

import 'package:akcsapp/Models/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CArtControLler extends GetxController {
  var cartProducts = [].obs;
  Rx<double> total = 0.0.obs;

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

    total = total + double.parse(model.price.toString());
  }

  remove(int index) {
    total = total - cartProducts[index].total;
    cartProducts.removeAt(index);
    log(total.toString());
  }

  increment(int index) async {
    cartProducts[index].qty++;
    cartProducts[index].total = cartProducts[index].price;
    cartProducts[index].total =
        cartProducts[index].price * cartProducts[index].qty;

    total = (total + cartProducts[index].price);
  }

  decrement(int index) async {
    cartProducts[index].qty--;

    cartProducts[index].total =
        cartProducts[index].price * cartProducts[index].qty;
    total = (total - cartProducts[index].price);
  }
}
