import 'dart:developer';

import 'package:akcsapp/Controllers_Getx/adressController.dart';
import 'package:akcsapp/Models/Adress/AdressModel.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class adREssSelectIOn extends StatelessWidget {
  const adREssSelectIOn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), child: appbarakcs()),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                    height: 180, 'assets/images/delivery_adress_selection.png'),
                Text('Select delivery address',
                    style: GoogleFonts.aBeeZee(fontSize: 20)),
                SizedBox(
                  height: 20,
                )
              ],
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
                              log(index.toString());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 2, 255, 57))),
                              child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListTile(
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          addrs.HomeNAme,
                                          style:
                                              GoogleFonts.aBeeZee(fontSize: 20),
                                        ),
                                        Text(
                                          addrs.Street,
                                          style:
                                              GoogleFonts.aBeeZee(fontSize: 18),
                                        ),
                                        Text(
                                          addrs.District,
                                          style:
                                              GoogleFonts.aBeeZee(fontSize: 15),
                                        ),
                                        Text(
                                          addrs.State,
                                          style:
                                              GoogleFonts.aBeeZee(fontSize: 12),
                                        ),
                                        Text(
                                          addrs.Pincode,
                                          style:
                                              GoogleFonts.aBeeZee(fontSize: 12),
                                        ),
                                        Text(
                                          addrs.Phone,
                                          style:
                                              GoogleFonts.aBeeZee(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    //  leading: Text(count.toString()),
                                  )),
                            ),
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
    );
  }
}
