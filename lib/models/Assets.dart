import 'Preview.dart';
import 'SmallThumb.dart';
import 'LargeThumb.dart';
import 'HugeThumb.dart';
import 'Preview1000.dart';
import 'Preview1500.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'Assets.g.dart';


@JsonSerializable()
@HiveType(typeId: 1)
class Assets{
  @HiveField(0)
  Preview preview;
  @HiveField(1)
  SmallThumb small_thumb;
  @HiveField(2)
  LargeThumb large_thumb;
  @HiveField(3)
  HugeThumb huge_thumb;
  @HiveField(4)
  Preview1000 preview_1000;
  @HiveField(5)
  Preview1500 preview_1500;

  Assets(this.preview, this.small_thumb, this.large_thumb, this.huge_thumb,
      this.preview_1000, this.preview_1500);

  factory Assets.fromJson(Map<String, dynamic> json) => _$AssetsFromJson(json);
  Map<String, dynamic> toJson() => _$AssetsToJson(this);
}
