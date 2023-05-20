// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Preview1500.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Preview1500Adapter extends TypeAdapter<Preview1500> {
  @override
  final int typeId = 7;

  @override
  Preview1500 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Preview1500(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Preview1500 obj) {
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
      other is Preview1500Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preview1500 _$Preview1500FromJson(Map<String, dynamic> json) => Preview1500(
      json['height'] as int,
      json['url'] as String,
      json['width'] as int,
    );

Map<String, dynamic> _$Preview1500ToJson(Preview1500 instance) =>
    <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };
