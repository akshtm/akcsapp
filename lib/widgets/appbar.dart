import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class appbarakcs extends StatelessWidget {
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
              Badge(
                position: BadgePosition.topEnd(end: 0),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  '2',
                  //cart.count.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_grocery_store_outlined)),
              ),
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
