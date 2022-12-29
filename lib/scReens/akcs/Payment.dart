import 'package:akcsapp/Controllers_Getx/cartcontroller.dart';
import 'package:akcsapp/Controllers_Getx/checkOutController.dart';
import 'package:akcsapp/scReens/akcs/adressSelection.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class lottiePaymentPage extends StatelessWidget {
  lottiePaymentPage({super.key});
  var size, height, width;
  CheckOutController _checkOutController = Get.put(CheckOutController());
  CArtControLler _cArtControLler = Get.put(CArtControLler());

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
            child: Lottie.asset('assets/images/payment.json'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 211, 114),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 10, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '     Delivery Address:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton.icon(
                            onPressed: () {
                              Get.to(adREssSelectIOn());
                            },
                            icon: Icon(Icons.change_circle_outlined),
                            label: Text('Change'))
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        _checkOutController.adress.value.toString(),
                        style: GoogleFonts.sourceSansPro(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                child: ListView.separated(
                    itemBuilder: (BuildContext, index) {
                      final items = _cArtControLler.cartProducts[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(items.name),
                          Text('X'),
                          Text(items.qty.toString() + 'KG'),
                          Text('='),
                          Text(items.total.toString())
                        ],
                      );

                      //ListTile(title: Text(items.name));
                    },
                    separatorBuilder: (BuildContext, int) {
                      return Divider(
                        thickness: 1,
                      );
                    },
                    itemCount: _cArtControLler.cartProducts.length),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
