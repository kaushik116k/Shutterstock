import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'Preview1500.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class Preview1500{
  @HiveField(0)
  int height;
  @HiveField(1)
  String url;
  @HiveField(2)
  int width;
  Preview1500(this.height, this.url, this.width);

  factory Preview1500.fromJson(Map<String, dynamic> json) => _$Preview1500FromJson(json);
  Map<String, dynamic> toJson() => _$Preview1500ToJson(this);
}