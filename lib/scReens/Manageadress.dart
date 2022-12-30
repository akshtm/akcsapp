import 'dart:developer';

import 'package:akcsapp/Controllers_Getx/adressController.dart';
import 'package:akcsapp/Models/Adress/AdressModel.dart';
import 'package:akcsapp/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Manageadress extends StatelessWidget {
  Manageadress({Key? key}) : super(key: key);
  var size, height, width;
  ADressController _aDressController = Get.put(ADressController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _aDressController.refreshAdress();
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), child: appbarakcs()),
      body: Column(
        children: [
          InkWell(
            onTap: (() {
              Get.defaultDialog(
                  title: 'Add',
                  content: Form(
                    key: _formKey,
                    child: Container(
                      height: height / 2,
                      width: width,
                      child: Column(
                        children: [
                          Obx(() => ElevatedButton.icon(
                              onPressed: () {
                                _aDressController.getCurrentLocation();

                                log(_aDressController.currentLocationAddress
                                    .toString());
                              },
                              icon: _aDressController.isloading.value == true
                                  ? Icon(Icons.location_on_outlined)
                                  : Icon(Icons.refresh_rounded),
                              label: _aDressController.isloading.value == true
                                  ? Text('Fetching....')
                                  : Text('Try to Autofill'))),
                          TextFormField(
                            controller: _aDressController.HomeNAMeTextControl,
                            decoration:
                                InputDecoration(label: Text('House Name')),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter house name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: _aDressController.PhoneTextControl,
                            decoration: InputDecoration(label: Text('Phone')),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some contact numer';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _aDressController.StreetTextControl,
                            decoration: InputDecoration(label: Text('Street')),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your street name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            controller: _aDressController.pincodeTextControl,
                            decoration: InputDecoration(label: Text('Pincode')),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your pincode';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _aDressController.CItyTextControl,
                            decoration: InputDecoration(label: Text('City')),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter district';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _aDressController.stateTextControl,
                            decoration: InputDecoration(label: Text('State')),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter state';
                              }
                              return null;
                            },
                          ),
                          ElevatedButton.icon(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.

                                  final adress = AdressModel(
                                      HomeNAme: _aDressController
                                          .HomeNAMeTextControl.text,
                                      Phone: _aDressController
                                          .PhoneTextControl.text,
                                      Street: _aDressController
                                          .StreetTextControl.text,
                                      District: _aDressController
                                          .CItyTextControl.text,
                                      Pincode: _aDressController
                                          .pincodeTextControl.text,
                                      State: _aDressController
                                          .stateTextControl.text);
                                  await _aDressController.addAdress_DB(adress);
                                  await _aDressController.refreshAdress();
                                  _aDressController.HomeNAMeTextControl.clear();
                                  _aDressController.PhoneTextControl.clear();
                                  _aDressController.StreetTextControl.clear();
                                  _aDressController.CItyTextControl.clear();
                                  _aDressController.pincodeTextControl.clear();
                                  _aDressController.stateTextControl.clear();

                                  Navigator.pop(context);
                                }
                              },
                              icon: Icon(Icons.save_rounded),
                              label: Text('SAVE'))
                        ],
                      ),
                    ),
                  ));
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height / 12,
                  width: width / 5,
                  child: Image.asset('assets/images/NewADres.png'),
                ),
                Text(
                  'Add Adress',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
          ),
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable: adressListNotifier,
                  builder:
                      (BuildContext ctx, List<AdressModel> newList, Widget? _) {
                    return ListView.separated(
                        itemBuilder: (ctx, index) {
                          final count = index + 1;
                          final addrs = newList[index];
                          return Slidable(
                            key: Key(addrs.Id),
                            startActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                onPressed: (ctx) {
                                  _aDressController.deleteTransaction(addrs.Id);
                                  // transactionDB.instance.deleteTransaction(value.id!);
                                },
                                icon: Icons.delete,
                                label: 'Delete',
                              )
                            ]),
                            child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                  leading: Text(count.toString()),
                                )),
                          );
                        },
                        separatorBuilder: (BuildContext, int) {
                          return Divider(
                            thickness: 2,
                          );
                        },
                        itemCount: newList.length);
                  }))
        ],
      ),
    );
  }
}
