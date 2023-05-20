import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'HugeThumb.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class HugeThumb{
  @HiveField(0)
  int height;
  @HiveField(1)
  String url;
  @HiveField(2)
  int width;
  HugeThumb(this.height, this.url, this.width);

  factory HugeThumb.fromJson(Map<String, dynamic> json) => _$HugeThumbFromJson(json);
  Map<String, dynamic> toJson() => _$HugeThumbToJson(this);
}