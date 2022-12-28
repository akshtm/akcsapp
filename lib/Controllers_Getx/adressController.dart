import 'dart:developer';

import 'package:akcsapp/Models/Adress/AdressModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<AdressModel>> adressListNotifier = ValueNotifier([]);

class ADressController extends GetxController {
  //var cartProducts = [].obs;
  Position? currentPosition;
  String? currentLocationAddress;

  final HomeNAMeTextControl = TextEditingController();
  final StreetTextControl = TextEditingController();
  final PhoneTextControl = TextEditingController();
  final pincodeTextControl = TextEditingController();
  final CItyTextControl = TextEditingController();
  final stateTextControl = TextEditingController();

  Future<void> addAdress_DB(AdressModel AdresAdd) async {
    log('inside addAdress_DB ');
    final _db = await Hive.openBox<AdressModel>('Adress_DB');

    _db.put(AdresAdd.Id, AdresAdd);
  }

  Future<List<AdressModel>> getAllADresData() async {
    final _db = await Hive.openBox<AdressModel>('Adress_DB');
    return _db.values.toList();
  }

  Future<void> refreshAdress() async {
    final _list = await getAllADresData();
    _list.sort((first, second) => second.Id.compareTo(first.Id));
    adressListNotifier.value.clear();
    adressListNotifier.value.addAll(_list);
    adressListNotifier.notifyListeners();
  }

  Future<void> deleteTransaction(String id) async {
    final _db = await Hive.openBox<AdressModel>('Adress_DB');

    await _db.delete(id);
    refreshAdress();
  }

  getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      currentPosition = position;
      getCurrentLocationAddress();
    }).catchError((e) {
      print(e);
    });
  }

  getCurrentLocationAddress() async {
    try {
      List<Placemark> listPlaceMarks = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);
      Placemark place = listPlaceMarks[0];

      currentLocationAddress =
          "${place.locality}, ${place.postalCode}, ${place.subLocality},${place.administrativeArea},${place.thoroughfare},${place.name}";
      HomeNAMeTextControl.text = place.name!;
      StreetTextControl.text = place.subLocality!;
      stateTextControl.text = place.administrativeArea!;
      pincodeTextControl.text = place.postalCode!;
      CItyTextControl.text = place.locality!;
    } catch (e) {
      print(e);
    }
  }
}
