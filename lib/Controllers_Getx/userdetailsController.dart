import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserDetailsController extends GetxController {
  String? uidd;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void uid() {
    log('inside the function uid');
    final User? user = auth.currentUser;
    final uid = user?.uid;
    uidd = uid;

    log(uid.toString());
  }
}
