import 'dart:developer';

import 'package:akcsapp/widgets/appbar.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class aKcsProductDetails extends StatelessWidget {
  String productid, image, description, price, productname, offprice;
  aKcsProductDetails(
      {required this.description,
      required this.image,
      required this.price,
      required this.productid,
      required this.productname,
      required this.offprice});

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
                  padding: EdgeInsets.only(top: 70, left: 30),
                  child: Text(
                    //'shoes'
                    productname,

                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),

              Padding(
                  padding: EdgeInsets.only(left: 30, top: 120),
                  child: Text(
                    '₹${price}',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30, top: 155),
                  child: Text(
                    '₹${offprice}',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
              // Consumer<Wishlist>(builder: (context, wishlist, child) {
              //   return Padding(
              //     padding: const EdgeInsets.only(left: 30, top: 250),
              //     child: IconButton(
              //       icon: wishlist.isItemExist(widget.productId)
              //           ? Icon(Icons.favorite, color: Colors.red)
              //           : Icon(Icons.favorite, color: Colors.grey),
              //       iconSize: 35,
              //       onPressed: () {
              //         setState(() {
              //           log("clicked ===");
              //           if (wishlist.isItemExist(widget.productId)) {
              //             ScaffoldMessenger.of(context).showSnackBar(
              //               SnackBar(
              //                 duration: Duration(milliseconds: 30),
              //                 behavior: SnackBarBehavior.floating,
              //                 backgroundColor: Color.fromARGB(255, 174, 166, 166),
              //                 content: Text(
              //                   'ITEM  ALREADY IN WISHLIST',
              //                   textAlign: TextAlign.center,
              //                 ),
              //               ),
              //             );

              //             log("item already in WISHLIST");
              //           } else {
              //             context.read<Wishlist>().addItem(widget.name,
              //                 widget.price, 1, widget.image1, widget.productId);
              //           }
              //         });

              //         // context.read<Wishlist>().addItem(widget.name,widget.price, 1, widget.image1,widget.productId);
              //       },
              //     ),
              //   );
              // }),
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
                  child: Badge(
                    //position: BadgePosition.bottomStart(),
                    animationDuration: Duration(milliseconds: 300),

                    animationType: BadgeAnimationType.slide,

                    badgeContent: Text(
                      '2',
                      //cart.count.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        iconSize: 34,
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => mycart()));
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 10),
                child: Container(
                  height: 50,
                  width: 140,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    //color: product.color,
                    onPressed: () {
                      //  log("name=====" + widget.productId);

                      //   if (cart.isItemExist(widget.productId)) {
                      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //         duration: Duration(milliseconds: 30),
                      //         behavior: SnackBarBehavior.floating,
                      //         backgroundColor:
                      //             Color.fromARGB(255, 174, 166, 166),
                      //         content: Text(
                      //           'ITEM ALREADY IN CART',
                      //           textAlign: TextAlign.center,
                      //         )));

                      //     log("item already in cart");
                      //   } else {
                      //     context.read<Cart>().addItem(widget.name,
                      //         widget.price, 1, widget.image1, widget.productId);
                      //   }

                      //   log("message");
                      // },
                      child:
                      Text(
                        "ADD CART ".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    },
                    child: Text('ADD'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
