import 'dart:developer';
import 'dart:ui';
import 'package:akcsapp/Controllers_Getx/aUth_cOntroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class aUth_oTp extends StatelessWidget {
  aUth_oTp({Key? key}) : super(key: key);
  FormX aUfx = Get.put(FormX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 119, 147),
      body: SafeArea(
          child: Form(
              child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Verification Code',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    '   Please Wait \n   We have send the  verification code to',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.white)),
                Text('+91******' + aUfx.username.value.substring(6),
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: aUfx.a_controller,
                    onSaved: ((PIN1) =>
                        {log('the pi pin pin' + PIN1.toString())}),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 170, 188, 32))),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (a) {
                      // log('+++++++++++++++++++' + a);
                      if (a.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: aUfx.b_controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 170, 188, 32))),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (b) {
                      if (b.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: aUfx.c_controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 170, 188, 32))),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (c) {
                      if (c.length == 1) {
                        FocusScope.of(context).nextFocus();
                        c = c;
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: aUfx.d_controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 170, 188, 32))),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (d) {
                      if (d.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: aUfx.e_controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 170, 188, 32))),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (e) {
                      if (e.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: aUfx.f_controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 170, 188, 32))),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (g) {
                      // finals = a + b + c + d + e + f + g;
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You can resend the code after',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              Obx(
                () => Text(aUfx.counter.toString() + "Seconds",
                    style: TextStyle(fontSize: 20, color: Colors.red)),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              aUfx.otpCobiner();
              // aUfx.oTpcHeck_();
              aUfx.verify_otp();

              log(aUfx.otp);
            },
            child: Text(
              'VERIFY OTP',
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 216, 223, 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          )
        ],
      ))),
    );
  }
}
