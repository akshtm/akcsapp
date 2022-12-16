// import 'dart:developer';
// import 'dart:ffi';

import 'dart:developer';

import 'package:akcsapp/Controllers_Getx/cartcontroller.dart';
import 'package:akcsapp/Models/cartModel.dart';
import 'package:akcsapp/scReens/akcs/cart.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class aKcsProductDetails extends StatelessWidget {
  String image, description, productname, productid;
  double? price, liveprice, pricechange;

  // int? price;
  aKcsProductDetails({
    required this.description,
    required this.image,
    required this.liveprice,
    required this.productid,
    required this.productname,
    required this.price,
    required this.pricechange,
    // required this.offprice
  });
  static const colorizeColors = [
    Colors.grey,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 15.0,
    fontFamily: 'Horizon',
  );
  CArtControLler cArtControLler = Get.put(CArtControLler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: appbarakcs(),
          preferredSize: Size.fromHeight(100),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 250,
                color: Color.fromARGB(255, 239, 239, 239),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 220),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 50, left: 30),
                  child: Text(
                    productname,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
              Visibility(
                visible: price! > liveprice!,
                child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 100),
                    child: Text(
                      '₹${price}',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30, top: 135),
                  child: Text(
                    '₹${liveprice.toString()}',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30, top: 175),
                  child: Visibility(
                    visible: liveprice! < price!,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'You can now save ₹' + pricechange.toString(),
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      totalRepeatCount: 500000,
                    ),

                    // Text(
                    //   'You can now save ₹' + pricechange.toString(),
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //       fontStyle: FontStyle.italic),
                    // ),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 340),
                  child: Text(
                    //'shoeaaa'
                    productname,
                    style: TextStyle(
                        fontSize: 30,
                        // fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 390, left: 10),
                  child: Text(
                    // 'available',
                    description,
                    style: TextStyle(
                        fontSize: 24,
                        // fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    height: 200,
                    // color: Colors.red,
                    child:

                        // Image(image: AssetImage('assets\icon\123.png'),
                        //  height: 220,
                        //   width: 200, ),

                        Image.network(
                      //  //'https://pngimg.com/uploads/women_shoes/women_shoes_PNG7464.png',

                      image,
                      height: 220,
                      width: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet:

            //return Text('data');

            Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromARGB(255, 238, 235, 235),
          ),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Container(
                    //padding: const EdgeInsets.only(left: 20),
                    // margin: EdgeInsets.only(right: 50),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Obx(
                      () => Badge(
                        //position: BadgePosition.bottomStart(),
                        animationDuration: Duration(milliseconds: 300),

                        animationType: BadgeAnimationType.slide,

                        badgeContent: Text(
                          cArtControLler.cartProducts.length.toString(),
                          //cart.count.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        child: IconButton(
                            icon: Icon(Icons.shopping_cart),
                            iconSize: 34,
                            onPressed: () {
                              Get.to(cart());
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => mycart()));
                            }),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 10),
                child: Container(
                  height: 50,
                  width: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            Color.fromARGB(255, 17, 119, 147), // background
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        log('CArt');
                        log(productname);
                        log(image);
                        log(liveprice.toString());
                        log('productId' + productid.toString());
                        CartMOdel cartMOdelAdd = CartMOdel(
                            name: productname,
                            image: image,
                            price: liveprice,
                            qty: 1,
                            product_id: productid,
                            total: liveprice);
                        cArtControLler.addProduct(cartMOdelAdd);
                      },
                      child: Text(
                        "ADD CART ".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
