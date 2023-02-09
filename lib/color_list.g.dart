// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorListAdapter extends TypeAdapter<ColorList> {
  @override
  final int typeId = 0;

  @override
  ColorList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorList(
      name: fields[0] as String?,
      code: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ColorList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
