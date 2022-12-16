import 'dart:developer';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Dashcontroller extends GetxController {
  makingphonecall() async {
    log('inside  _makingphonecall');
    var url = Uri.parse('tel:9539146521');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+917736241467',
    );
    await launch('$link');
  }
}
