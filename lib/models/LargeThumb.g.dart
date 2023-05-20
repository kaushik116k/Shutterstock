// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LargeThumb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LargeThumbAdapter extends TypeAdapter<LargeThumb> {
  @override
  final int typeId = 4;

  @override
  LargeThumb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LargeThumb(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LargeThumb obj) {
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
      other is LargeThumbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LargeThumb _$LargeThumbFromJson(Map<String, dynamic> json) => LargeThumb(
      json['height'] as int,
      json['url'] as String,
      json['width'] as int,
    );

Map<String, dynamic> _$LargeThumbToJson(LargeThumb instance) =>
    <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };
