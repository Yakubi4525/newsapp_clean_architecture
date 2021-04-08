// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalArticleModelAdapter extends TypeAdapter<LocalArticleModel> {
  @override
  final int typeId = 1;

  @override
  LocalArticleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalArticleModel(
      source: fields[0] as LocalSourceModel,
      author: fields[1] as String,
      title: fields[2] as String,
      description: fields[3] as String,
      url: fields[4] as String,
      img: fields[5] as String,
      date: fields[6] as String,
      content: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalArticleModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.img)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalArticleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
