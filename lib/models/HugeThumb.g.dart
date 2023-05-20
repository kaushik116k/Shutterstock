// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HugeThumb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HugeThumbAdapter extends TypeAdapter<HugeThumb> {
  @override
  final int typeId = 3;

  @override
  HugeThumb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HugeThumb(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HugeThumb obj) {
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
      other is HugeThumbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HugeThumb _$HugeThumbFromJson(Map<String, dynamic> json) => HugeThumb(
      json['height'] as int,
      json['url'] as String,
      json['width'] as int,
    );

Map<String, dynamic> _$HugeThumbToJson(HugeThumb instance) => <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };
