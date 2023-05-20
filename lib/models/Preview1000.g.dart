// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Preview1000.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Preview1000Adapter extends TypeAdapter<Preview1000> {
  @override
  final int typeId = 6;

  @override
  Preview1000 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Preview1000(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Preview1000 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.height)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.width);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Preview1000Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preview1000 _$Preview1000FromJson(Map<String, dynamic> json) => Preview1000(
      json['height'] as int,
      json['url'] as String,
      json['width'] as int,
    );

Map<String, dynamic> _$Preview1000ToJson(Preview1000 instance) =>
    <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };
