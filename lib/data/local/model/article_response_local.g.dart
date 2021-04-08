// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalArticleResponseModelAdapter
    extends TypeAdapter<LocalArticleResponseModel> {
  @override
  final int typeId = 2;

  @override
  LocalArticleResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalArticleResponseModel(
      (fields[0] as List)?.cast<LocalArticleModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalArticleResponseModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalArticleResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
