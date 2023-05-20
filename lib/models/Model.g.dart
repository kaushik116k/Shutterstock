// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final int typeId = 0;

  @override
  Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      (fields[4] as List).cast<Data>(),
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.per_page)
      ..writeByte(2)
      ..write(obj.total_count)
      ..writeByte(3)
      ..write(obj.search_id)
      ..writeByte(4)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      json['page'] as int,
      json['per_page'] as int,
      json['total_count'] as int,
      json['search_id'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total_count': instance.total_count,
      'search_id': instance.search_id,
      'data': instance.data,
    };
