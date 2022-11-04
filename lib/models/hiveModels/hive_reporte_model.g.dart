// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_reporte_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReporteModelAdapter extends TypeAdapter<ReporteModel> {
  @override
  final int typeId = 3;

  @override
  ReporteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReporteModel(
      autor: fields[0] as String,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReporteModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.autor)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReporteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
