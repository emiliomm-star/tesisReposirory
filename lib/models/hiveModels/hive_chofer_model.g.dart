// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_chofer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChoferAdapter extends TypeAdapter<Chofer> {
  @override
  final int typeId = 0;

  @override
  Chofer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chofer(
      ci: fields[0] as String,
      name: fields[1] as String,
      job: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Chofer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ci)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.job);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoferAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
