import 'dart:developer';

import 'package:akcsapp/Controllers_Getx/adressController.dart';
import 'package:akcsapp/Controllers_Getx/checkOutController.dart';
import 'package:akcsapp/Models/Adress/AdressModel.dart';
import 'package:akcsapp/scReens/akcs/Payment.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class adREssSelectIOn extends StatelessWidget {
  var size, height, width;
  adREssSelectIOn({Key? key}) : super(key: key);
  CheckOutController _checkOutController = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), child: appbarakcs()),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey[100],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                child: Row(
                  children: [
                    Image.asset(
                        height: 180,
                        'assets/images/delivery_adress_selection.png'),
                    Text('Select delivery address',
                        style: GoogleFonts.aBeeZee(fontSize: 20)),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: adressListNotifier,
                  builder:
                      (BuildContext ctx, List<AdressModel> newList, Widget? _) {
                    return ListView.separated(
                        itemBuilder: (BuildContext, index) {
                          final addrs = newList[index];

                          return InkWell(
                            onTap: () {
                              // log(index.toString());
                              // final a, b, c, d, e;
                              // a = addrs.HomeNAme;
                              // b = addrs.Street;
                              // c=sdre

                              _checkOutController.selectdIntx.value = index;
                              _checkOutController.adress.value =
                                  addrs.HomeNAme +
                                      ',' +
                                      addrs.Street +
                                      '\n' +
                                      addrs.District +
                                      ',' +
                                      addrs.Pincode +
                                      '\n' +
                                      addrs.Phone;

                              log(_checkOutController.adress.value);
                            },
                            child: Obx(() => Container(
                                  decoration: BoxDecoration(

                                      //color: Colors.green
                                      // border: Border.all(
                                      //     width: 10,
                                      //     color: _checkOutController
                                      //                 .selectdIntx.value ==
                                      //             index
                                      //         ? Color.fromARGB(255, 2, 255, 57)
                                      //         : Colors.black)

                                      ),
                                  child: Card(
                                      color: _checkOutController
                                                  .selectdIntx.value ==
                                              index
                                          ? Colors.green
                                          : Colors.white,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              addrs.HomeNAme,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              addrs.Street,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              addrs.District,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              addrs.State,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              addrs.Pincode,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              addrs.Phone,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        //  leading: Text(count.toString()),
                                      )),
                                )),
                          );
                        },
                        separatorBuilder: (BuildContext, int) {
                          return Divider(
                            thickness: 0.5,
                          );
                        },
                        itemCount: adressListNotifier.value.length);
                  }),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Color.fromARGB(255, 248, 245, 245),
        height: height / 12,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: InkWell(
            onTap: () {
              Get.to(lottiePaymentPage());
            },
            child: Container(
              // width: width / 1.2,

              color: Color.fromARGB(255, 242, 220, 19),
              child: Align(
                  child: Text(
                'CONTINUE',
                style: GoogleFonts.aBeeZee(fontSize: 18),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
