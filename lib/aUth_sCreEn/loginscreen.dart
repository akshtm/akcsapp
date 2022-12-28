import 'dart:developer';

import 'package:akcsapp/scReens/dashboard.dart';
import 'package:akcsapp/uSer_Data/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // String? token;
  var size, height, width;
  String? pin;
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  TextEditingController phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        // token = await authCredential.user?.getIdToken();
        // log("Tokeeeeeennnn" + token.toString());

        // box.write('UserContact', phoneController.text);
        // box.write('UserTyp', 'user');
        box.write('user', 'true');
        box.write('userphone', phoneController.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => dashboard()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      print("message======" + e.message.toString());
      // _scaffoldKey.currentState!
      //     .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        getlogiphonnwidget(context),
        // Text(
        //   textAlign: TextAlign.center,
        //   'PLEASE PROVIDE YOUR MOBILE NUMBER\nFOR VERIFICATION',
        //   style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.w300,
        //       fontSize: 15,
        //       decoration: TextDecoration.underline,
        //       decorationStyle: TextDecorationStyle.solid),
        // ),
        // Spacer(),
        Text(
          textAlign: TextAlign.center,
          'PLEASE PROVIDE YOUR MOBILE NUMBER\nFOR VERIFICATION',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 15,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: phoneController,
          decoration: InputDecoration(
              // errorText: fx.errorText.value,
              errorStyle: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 240, 98, 98)),
              // hintText: "Mobile",
              prefixText: '  +91',
              prefixIcon: Icon(Icons.call),
              filled: true,
              fillColor: Colors.blue.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )),
        ),
        SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: "+91" + phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                print("verificationFailed message" +
                    verificationFailed.message.toString());
                // _scaffoldKey.currentState.showSnackBar(
                //     SnackBar(content: Text(verificationFailed.message)));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text("REQUEST OTP"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 17, 119, 147),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Color.fromARGB(255, 210, 209, 209))))),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        getlogiphonnwidget(context),
        TextField(
          keyboardType: TextInputType.number,
          controller: otpController,
          decoration: InputDecoration(
              // errorText: fx.errorText.value,
              errorStyle: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 240, 98, 98)),
              // hintText: "Mobile",

              filled: true,
              fillColor: Colors.blue.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )),
        ),
        SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () async {
            log("pin print inside the elevated button" + pin.toString());
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 17, 119, 147),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Color.fromARGB(255, 210, 209, 209))))),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 17, 119, 147),
              Color.fromARGB(255, 114, 180, 185)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }

  getlogiphonnwidget(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: RichText(
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
                      text: '               AREEKODE CHIKKEN STALL\n ',
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
          ),
          // Icon(
          //   size: 100,
          //   Icons.person_pin,
          // )
        ],
      ),
      height: height / 2.5,
      //color: Color.fromARGB(255, 184, 9, 9),
    );
  }

  // getloginotpwidget(context) {
  //   return Container(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [Icon(size: 100, Icons.lock_person_sharp)],
  //     ),
  //     height: height / 10,
  //     //color: Color.fromARGB(255, 184, 9, 9),
  //   );
  // }
}
