import 'package:json_annotation/json_annotation.dart';
import 'Assets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'Data.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Data{
  @HiveField(0)
  String id;
  @HiveField(1)
  double aspect;
  @HiveField(2)
  Assets assets;
  @HiveField(3)
  String description;
  @HiveField(4)
  String image_type;
  @HiveField(5)
  String media_type;


  Data(this.id, this.aspect, this.assets, this.description, this.image_type, this.media_type);
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

}
