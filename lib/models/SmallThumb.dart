import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'SmallThumb.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class SmallThumb{
  @HiveField(0)
  int height;
  @HiveField(1)
  String url;
  @HiveField(2)
  int width;
  SmallThumb(this.height, this.url, this.width);

  factory SmallThumb.fromJson(Map<String, dynamic> json) => _$SmallThumbFromJson(json);
  Map<String, dynamic> toJson() => _$SmallThumbToJson(this);
}