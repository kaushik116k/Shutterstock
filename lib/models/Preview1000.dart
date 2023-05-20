import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'Preview1000.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class Preview1000{
  @HiveField(0)
  int height;
  @HiveField(1)
  String url;
  @HiveField(2)
  int width;
  Preview1000(this.height, this.url, this.width);

  factory Preview1000.fromJson(Map<String, dynamic> json) => _$Preview1000FromJson(json);
  Map<String, dynamic> toJson() => _$Preview1000ToJson(this);
}