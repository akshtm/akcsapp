import 'package:hive_flutter/hive_flutter.dart';
part 'AdressModel.g.dart';

@HiveType(typeId: 1)
class AdressModel {
  @HiveField(0)
  late String Id;
  @HiveField(1)
  late String HomeNAme;
  @HiveField(2)
  late String Phone;
  @HiveField(3)
  late String Street;
  @HiveField(4)
  late String Pincode;
  @HiveField(5)
  late String District;
  @HiveField(6)
  late String State;

  AdressModel(
      {required this.HomeNAme,
      required this.Phone,
      required this.Street,
      required this.District,
      required this.Pincode,
      required this.State}) {
    Id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
