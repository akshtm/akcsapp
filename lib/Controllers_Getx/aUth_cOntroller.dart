import 'dart:async';
import 'dart:developer';

import 'package:akcsapp/uSer_Data/usER_dAta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

class FormX extends GetxController {
  TextEditingController a_controller = TextEditingController();
  TextEditingController b_controller = TextEditingController();
  TextEditingController c_controller = TextEditingController();
  TextEditingController d_controller = TextEditingController();
  TextEditingController e_controller = TextEditingController();
  TextEditingController f_controller = TextEditingController();
  String otp = "";

  late Timer timer;
  RxInt counter = 120.obs;
  RxString username = RxString('');
  RxnString errorText = RxnString(null);
  Rxn<Function()> submitFunc = Rxn<Function()>(null);
  var authstate = ''.obs;
  String verificationId = '';

  var auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
    debounce<String>(username, validations,
        time: const Duration(milliseconds: 900));
  }

  void validations(String val) async {
    errorText.value = null; // reset validation errors to nothing
    submitFunc.value = null; // disable submit while validating
    if (val.isNotEmpty) {
      if (lengthOK(val) && await available(val)) {
        print('All validations passed, enable submit btn...');
        submitFunc.value = submitFunction();
        errorText.value = null;
      }
    }
  }

  bool lengthOK(String val, {int minLen = 10}) {
    if (val.length < minLen) {
      errorText.value = 'Enter a valid moble number!';
      return false;
    }
    return true;
  }

  Future<bool> available(String val) async {
    print('Query availability of: $val');
    await Future.delayed(
        const Duration(seconds: 1), () => print('Available query returned'));

    if (val == "Sylvester") {
      errorText.value = 'Name Taken';
      return false;
    }
    return true;
  }

  void usernameChanged(String val) {
    username.value = val;
    log(username.value.substring(6));
  }

  Future Function() submitFunction() {
    return () async {
      print('Make database call to create ${username.value} account');
      await Future.delayed(
          const Duration(seconds: 1), () => print('User account created'));
      return true;
    };
  }

  void otpCobiner() {
    otp = a_controller.text +
        b_controller.text +
        c_controller.text +
        d_controller.text +
        e_controller.text +
        f_controller.text;
  }

  ontimerr() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter > 0) {
        counter--;
      } else {
        timer.cancel();
      }
    });
  }

  generate_otp() async {
    await auth.verifyPhoneNumber(
        timeout: Duration(seconds: 60),
        phoneNumber: "+91" + username.value,
        verificationCompleted: (PhoneAuthCredential creddential) async {
          await auth.signInWithCredential(creddential).then((value) async {
            {
              // if (value.user != null) {
              //   print('user logged in');
              // }
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', 'Problem when send the code');
          print(e.message);
        },
        codeSent: (String id, int? resendToken) {
          print("clicked=====");
          this.verificationId = id;

          authstate.value = "login success";
        },
        codeAutoRetrievalTimeout: (id) {
          this.verificationId = id;
        });
  }

  verify_otp() async {
    log('inside the verify');
    var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId, smsCode: otp));

    if (credential.user != null) {
      log('inside the credential');
      // sharedPreference.saveUser(phone);

      log('+++++++++++++++++++++++++++++++++++++++++SUCESSS++++++++++++++++++++++');
      // Get.to(Qr_screen());

      // controllerss.logindata.setBool('login', false);
    }
  }

  // oTp_geNerate() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+91' + username.value,
  //     timeout: Duration(seconds: 60),
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       log('credential');
  //       await auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       if (e.code == 'invalid-phone-number') {
  //         print('The provided phone number is not valid.');
  //       }
  //     },
  //     codeSent: (String id, int? resendToken) async {
  //       this.verificationId = id;
  //       log('code sent');
  //       log('code sent' + verificationId);
  //       // PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       //     verificationId: this.verificationId, smsCode: otp);
  //       // await auth.signInWithCredential(credential);
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       Get.defaultDialog(
  //           title: 'Ooops...',
  //           content: Text('Session Expired\n Please Try Again'));
  //     },
  //   );
  // }

  //otp check
  // oTpcHeck_() async {
  //   log('inside the verification ');
  //   // try {
  //   //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //   //       verificationId: this.verificationId, smsCode: otp);
  //   //   await auth.signInWithCredential(credential);

  //   //   Get.to(usEr_dAta());
  //   // } catch (e) {
  //   //   log('wrong otp');
  //   // }

  //   var credential = await auth.signInWithCredential(
  //       PhoneAuthProvider.credential(
  //           verificationId: verificationId, smsCode: otp));

  //   if (credential.user != null) {
  //     log('inside the credential');
  //     // sharedPreference.saveUser(phone);
  //     Get.to(usEr_dAta());

  //     // controllerss.logindata.setBool('login', false);
  //   }
  // }
}
