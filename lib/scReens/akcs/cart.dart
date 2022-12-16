import 'dart:math';

import 'package:akcsapp/Controllers_Getx/cartcontroller.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: PreferredSize(
        child: appbarakcs(),
        preferredSize: Size.fromHeight(100),
      ),
      body: GetBuilder<CArtControLler>(
          builder: (controller) => controller.cartProducts.isEmpty
              ? Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        child: Text(
                          'Cart is empty 😕 ',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w200),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Image.asset('assets/images/empty_cart.png'),
                      ),
                    ],
                  ),
                )
              : Obx(() => ListView.builder(
                  itemCount: controller.cartProducts.length,
                  itemBuilder: (context, index) {
                    final cartitems = controller.cartProducts[index];

                    return Container(
                      width: width / 5,
                      height: height / 6.5,
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255),
                        elevation: 10,
                        child: Wrap(
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                leading: Container(
                                  height: 200,
                                  width: 100,

                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      image: DecorationImage(
                                          image: NetworkImage(cartitems.image
                                              // data.docs[index]['image']
                                              ),
                                          fit: BoxFit.cover)),
                                  // child: Image.network(data.docs[index]['image'])
                                ),
                                title: Text(cartitems.name,
                                    // data.docs[index]['item'],
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 79, 78, 77),
                                        fontSize: 20.0,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.black,
                                        decorationThickness: 0.15,
                                        fontWeight: FontWeight.w500)),
                                // ignore: prefer_const_constructors
                                subtitle: Wrap(
                                  children: [
                                    Text(
                                        'Total:  ' + cartitems.total.toString(),
                                        style: TextStyle(
                                            fontSize: 21.0,
                                            fontWeight: FontWeight.w300)),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (cartitems.qty > 1) {
                                                  controller.decrement(index);
                                                } else {
                                                  Get.snackbar(
                                                    "Warning",
                                                    "Minimum Quantity 1 is Requred",
                                                    icon: const Icon(
                                                      Icons
                                                          .warning_amber_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    backgroundColor: Colors.red,
                                                    // isDismissible: true,
                                                    //                                         isDismissible: true,
                                                    //  dismissDirection:left,
                                                  );
                                                }
                                              });
                                              // int quantity =
                                              //     documentSnapshot['qty'];
                                              // if (quantity > 1) {

                                              // } else {
                                              //   Get.snackbar("Error",
                                              //       "Minimum Quantity 1 is Requred");
                                              // }
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 20,
                                              color: Color.fromARGB(
                                                  255, 186, 22, 22),
                                            )),
                                        Text(cartitems.qty.toString(),
                                            // documentSnapshot['qty'].toString(),
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w300)),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                controller.increment(index);
                                              });
                                            },
                                            icon: Icon(Icons.add,
                                                size: 20,
                                                color: Color.fromARGB(
                                                    255, 47, 94, 4)))
                                      ],
                                    )
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      print("index :" + index.toString());
                                      controller.remove(index);

                                      // log("click id==" + cartitems.product_id);
                                      // setState(() {
                                      // controller.cartProducts.remove(index);

                                      //   log("worked");
                                      // });
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ))

                                //  Icon(Icons.cancel)
                                //  Text(data.docs[index]['item']),
                                )
                          ],
                        ),
                      ),
                    );
                  }))),
    );
  }
}
