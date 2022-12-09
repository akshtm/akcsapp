import 'dart:ffi';

import 'package:akcsapp/Controllers_Getx/aUth_cOntroller.dart';
import 'package:akcsapp/aUth_sCreEn/aUth_oTp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class aUth_MoB extends StatelessWidget {
  aUth_MoB({Key? key}) : super(key: key);
  FormX fx = Get.put(FormX()); // controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 119, 147),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: '_',
                    style: TextStyle(
                        color: Color.fromARGB(255, 216, 230, 21),
                        fontSize: 150),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'AK\n',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 254, 255),
                        fontSize: 150,
                      )),
                  TextSpan(
                      // text: '               AREEKODE CHIKKEN STALL\n ',
                      style: TextStyle(
                    color: Color.fromARGB(255, 216, 223, 14),
                    fontSize: 15,
                  )),
                  TextSpan(
                      text: 'CS ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 216, 223, 14),
                        fontSize: 150,
                      ))
                ])),
            SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 17, 119, 147),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'PLEASE PROVIDE YOUR MOBILE NUMBER\nFOR VERIFICATION',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 60, 20),
                    child: Center(child: Obx(() {
                      return TextFormField(
                        textAlign: TextAlign.start,
                        onChanged: fx.usernameChanged,
                        maxLength: 10,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            errorText: fx.errorText.value,
                            errorStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 240, 98, 98)),
                            // hintText: "Mobile",
                            prefixText: '  +91',
                            prefixIcon: Icon(Icons.call),
                            filled: true,
                            fillColor: Colors.blue.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                      );
                    })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // fx.oTp_geNerate();
                      fx.generate_otp();
                      fx.ontimerr();
                      Get.to(aUth_oTp());
                    },
                    child: Text(
                      'SIGN UP',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 216, 223, 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
