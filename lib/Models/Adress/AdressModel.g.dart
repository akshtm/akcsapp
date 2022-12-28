// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdressModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdressModelAdapter extends TypeAdapter<AdressModel> {
  @override
  final int typeId = 1;

  @override
  AdressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdressModel(
      HomeNAme: fields[1] as String,
      Phone: fields[2] as String,
      Street: fields[3] as String,
      District: fields[5] as String,
      Pincode: fields[4] as String,
      State: fields[6] as String,
    )..Id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, AdressModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.Id)
      ..writeByte(1)
      ..write(obj.HomeNAme)
      ..writeByte(2)
      ..write(obj.Phone)
      ..writeByte(3)
      ..write(obj.Street)
      ..writeByte(4)
      ..write(obj.Pincode)
      ..writeByte(5)
      ..write(obj.District)
      ..writeByte(6)
      ..write(obj.State);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
