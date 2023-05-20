import 'Data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'Model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Model {
  @HiveField(0)
  int page;
  @HiveField(1)
  int per_page;
  @HiveField(2)
  int total_count;
  @HiveField(3)
  String search_id;
  @HiveField(4)
  List<Data> data;

  Model(this.page, this.per_page, this.total_count, this.search_id, this.data);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);


}