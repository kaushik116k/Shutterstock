import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'Preview.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class Preview {
  @HiveField(0)
  int height;
  @HiveField(1)
  String url;
  @HiveField(2)
  int width;
  Preview(this.height, this.url, this.width);

  factory Preview.fromJson(Map<String, dynamic> json) => _$PreviewFromJson(json);
  Map<String, dynamic> toJson() => _$PreviewToJson(this);
}