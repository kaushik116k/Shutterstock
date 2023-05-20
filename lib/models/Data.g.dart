// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 2;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      fields[0] as String,
      fields[1] as double,
      fields[2] as Assets,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.aspect)
      ..writeByte(2)
      ..write(obj.assets)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.image_type)
      ..writeByte(5)
      ..write(obj.media_type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as String,
      (json['aspect'] as num).toDouble(),
      Assets.fromJson(json['assets'] as Map<String, dynamic>),
      json['description'] as String,
      json['image_type'] as String,
      json['media_type'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'aspect': instance.aspect,
      'assets': instance.assets,
      'description': instance.description,
      'image_type': instance.image_type,
      'media_type': instance.media_type,
    };
