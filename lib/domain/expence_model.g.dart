// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expence_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpModelAdapter extends TypeAdapter<ExpModel> {
  @override
  final int typeId = 1;

  @override
  ExpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpModel(
      exptitle: fields[0] as String,
      expdesc: fields[1] as String,
      expamount: fields[2] as String,
      expdate: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExpModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.exptitle)
      ..writeByte(1)
      ..write(obj.expdesc)
      ..writeByte(2)
      ..write(obj.expamount)
      ..writeByte(3)
      ..write(obj.expdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
