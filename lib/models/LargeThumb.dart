import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'LargeThumb.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class LargeThumb{
  @HiveField(0)
  int height;
  @HiveField(1)
  String url;
  @HiveField(2)
  int width;
  LargeThumb(this.height, this.url, this.width);

  factory LargeThumb.fromJson(Map<String, dynamic> json) => _$LargeThumbFromJson(json);
  Map<String, dynamic> toJson() => _$LargeThumbToJson(this);
}