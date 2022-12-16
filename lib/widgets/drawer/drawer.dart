import 'package:akcsapp/scReens/akcs/aKcsProductDetails.dart';
import 'package:akcsapp/uSer_Data/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class drawer extends StatelessWidget {
  drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 17, 119, 147),
            ),
            child: Text(
              '\nWELCOME TO \nAREECODE CHIKENSTALL\nECOM APP ',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'muli',
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart_outlined,
              size: 35,
              color: Colors.amber,
            ),
            title: Text(
              'My Orders',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 0.5,
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.info_rounded,
              size: 35,
              color: Color.fromARGB(255, 20, 181, 190),
            ),
            title: Text('About Us', style: TextStyle(fontSize: 20)),
            onTap: () {
              Get.defaultDialog(
                title: 'akash',
                titleStyle: TextStyle(fontSize: 25),
                middleText: 'details',
                middleTextStyle: TextStyle(fontSize: 20),
                backgroundColor: Colors.grey,
                radius: 20,
                textCancel: 'OK',
                cancelTextColor: Color.fromARGB(255, 255, 255, 255),
                // textConfirm: 'OK'
                //         // confirmTextColor: Colors.white,
                //         // onConfirm: () {
                //         // Get.to(tabbartest(),
                //         //     arguments: [namefromfire, hotel_id_fromfire]);
                //         // }
                //       );
                //     },
              );
            },
          ),
          Divider(thickness: 0.5),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 35,
              color: Color.fromARGB(255, 8, 8, 8),
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Are you sure do  you want to logout?',
                confirm: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      box.erase();

                      Get.snackbar('Logout', 'Logout Succesfully');
                    },
                    child: Text('Confirm')),
              );
            },
          ),
        ],
      ),
    );
  }
}
