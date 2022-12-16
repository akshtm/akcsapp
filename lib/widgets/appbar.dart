import 'package:akcsapp/Controllers_Getx/cartcontroller.dart';
import 'package:akcsapp/scReens/akcs/cart.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class appbarakcs extends StatelessWidget {
  CArtControLler cArtControLler = Get.put(CArtControLler());
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.notifications_active)),
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(end: 0),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cArtControLler.cartProducts.length.toString(),
                    //cart.count.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Get.to(cart());
                      },
                      icon: Icon(Icons.local_grocery_store_outlined)),
                ),
              )
            ],
          )
        ],
        backgroundColor: Color.fromARGB(255, 17, 119, 147),
        title: Container(
          child: Column(
            children: [
              Text('AREECODE CHIKENSTALL'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width / 22,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: 10,
                  ),
                  Text(
                    'cheruppa',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
