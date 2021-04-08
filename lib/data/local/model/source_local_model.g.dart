// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalSourceModelAdapter extends TypeAdapter<LocalSourceModel> {
  @override
  final int typeId = 0;

  @override
  LocalSourceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalSourceModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      url: fields[3] as String,
      category: fields[4] as String,
      country: fields[5] as String,
      language: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalSourceModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.country)
      ..writeByte(6)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalSourceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
