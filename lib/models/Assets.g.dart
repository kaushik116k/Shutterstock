// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Assets.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetsAdapter extends TypeAdapter<Assets> {
  @override
  final int typeId = 1;

  @override
  Assets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Assets(
      fields[0] as Preview,
      fields[1] as SmallThumb,
      fields[2] as LargeThumb,
      fields[3] as HugeThumb,
      fields[4] as Preview1000,
      fields[5] as Preview1500,
    );
  }

  @override
  void write(BinaryWriter writer, Assets obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.preview)
      ..writeByte(1)
      ..write(obj.small_thumb)
      ..writeByte(2)
      ..write(obj.large_thumb)
      ..writeByte(3)
      ..write(obj.huge_thumb)
      ..writeByte(4)
      ..write(obj.preview_1000)
      ..writeByte(5)
      ..write(obj.preview_1500);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assets _$AssetsFromJson(Map<String, dynamic> json) => Assets(
      Preview.fromJson(json['preview'] as Map<String, dynamic>),
      SmallThumb.fromJson(json['small_thumb'] as Map<String, dynamic>),
      LargeThumb.fromJson(json['large_thumb'] as Map<String, dynamic>),
      HugeThumb.fromJson(json['huge_thumb'] as Map<String, dynamic>),
      Preview1000.fromJson(json['preview_1000'] as Map<String, dynamic>),
      Preview1500.fromJson(json['preview_1500'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssetsToJson(Assets instance) => <String, dynamic>{
      'preview': instance.preview,
      'small_thumb': instance.small_thumb,
      'large_thumb': instance.large_thumb,
      'huge_thumb': instance.huge_thumb,
      'preview_1000': instance.preview_1000,
      'preview_1500': instance.preview_1500,
    };
