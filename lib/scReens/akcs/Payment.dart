import 'package:akcsapp/Controllers_Getx/checkOutController.dart';
import 'package:akcsapp/scReens/akcs/adressSelection.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class lottiePaymentPage extends StatelessWidget {
  lottiePaymentPage({super.key});
  var size, height, width;
  CheckOutController _checkOutController = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), child: appbarakcs()),
      body: ListView(
        children: [
          Container(
            height: height / 6,
            // color: Colors.black,
            child: Lottie.network(
                'https://assets5.lottiefiles.com/private_files/lf30_Jk3ls8.json'),
          ),
          Container(
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('     Delivery Address'),
                    TextButton.icon(
                        onPressed: () {
                          Get.to(adREssSelectIOn());
                        },
                        icon: Icon(Icons.change_circle_outlined),
                        label: Text('Change'))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 100, 5),
                  child: Text(_checkOutController.adress.value.toString()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
