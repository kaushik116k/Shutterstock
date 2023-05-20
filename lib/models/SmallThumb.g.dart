// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SmallThumb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SmallThumbAdapter extends TypeAdapter<SmallThumb> {
  @override
  final int typeId = 8;

  @override
  SmallThumb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SmallThumb(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SmallThumb obj) {
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
      other is SmallThumbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmallThumb _$SmallThumbFromJson(Map<String, dynamic> json) => SmallThumb(
      json['height'] as int,
      json['url'] as String,
      json['width'] as int,
    );

Map<String, dynamic> _$SmallThumbToJson(SmallThumb instance) =>
    <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };
