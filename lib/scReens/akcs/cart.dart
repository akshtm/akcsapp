import 'dart:math';

import 'package:akcsapp/Controllers_Getx/adressController.dart';
import 'package:akcsapp/Controllers_Getx/cartcontroller.dart';
import 'package:akcsapp/scReens/Manageadress.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  CArtControLler _CArtController = Get.put(CArtControLler());

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
                      decoration: BoxDecoration(),
                      width: width / 5,
                      height: height / 6.5,
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // color: Color.fromARGB(255, 194, 220, 227),
                        // Color.fromARGB(255, 255, 255, 255),
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromARGB(255, 221, 240, 246),
                                  Color.fromARGB(255, 255, 255, 255),
                                ],
                              )),
                          child: Wrap(
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                  leading: Container(
                                    height: 200,
                                    width: 100,

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
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
                                          color:
                                              Color.fromARGB(255, 79, 78, 77),
                                          fontSize: 20.0,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.black,
                                          decorationThickness: 0.15,
                                          fontWeight: FontWeight.w500)),

                                  // ignore: prefer_const_constructors
                                  subtitle: Wrap(
                                    children: [
                                      Text(
                                          'Total:  ₹' +
                                              cartitems.total.toString(),
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w300)),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (cartitems.qty > 0.5) {
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
                                                      backgroundColor:
                                                          Colors.red,
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
                                          Text(cartitems.qty.toString() + "KG",
                                              // documentSnapshot['qty'].toString(),
                                              style: TextStyle(
                                                  fontSize: 18.0,
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
                      ),
                    );
                  }))),
      bottomSheet: Container(
        height: height / 9,
        color: Color.fromARGB(255, 248, 245, 245),
        child: Column(
          children: [
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      _CArtController.cartProducts.length.toString() + " Items",
                      style: GoogleFonts.aBeeZee(fontSize: 15),
                    ),
                    Text(
                      "₹" + _CArtController.Grandtotal.value.toString(),
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    )
                  ],
                )),
            SizedBox(
              height: height / 60,
            ),
            InkWell(
              onTap: () {
                print('akasmd');
                print(adressListNotifier.value.length);

                if (adressListNotifier.value.length == 0) {
                  Get.defaultDialog(
                    title: 'No Delivery Adress Found',
                    content: Container(
                      child: Column(
                        children: [
                          Image.asset(
                              height: 300,
                              'assets/images/delivery-man-confused.png'),
                          Text('Please enter your  delivery adress')
                        ],
                      ),
                      decoration: BoxDecoration(),
                    ),
                    confirm: ElevatedButton.icon(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text('ADD ADRESS')),
                    // confirmTextColor: Colors.black,
                    // textConfirm: 'Add Adress',
                    // onConfirm: () {
                    //   Get.to(() => Manageadress());
                    // }
                  );
                }
                //if(adressListNotifier.value.length==null){}
                //  _CArtController.total.value = 0;
              },
              child: Container(
                width: width / 1.2,
                height: height / 20,
                color: Color.fromARGB(255, 242, 220, 19),
                child: Align(
                    child: Text(
                  'GO TO CHECK OUT',
                  style: GoogleFonts.aBeeZee(fontSize: 18),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
