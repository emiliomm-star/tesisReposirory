// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_vehiculo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehiculoModelAdapter extends TypeAdapter<VehiculoModel> {
  @override
  final int typeId = 2;

  @override
  VehiculoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehiculoModel(
      chapa: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VehiculoModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.chapa);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehiculoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
