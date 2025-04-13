import 'package:everything/data/enums/topic_type_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic_model.g.dart';

@JsonSerializable()
class TopicModel {
  final int? id;
  final String title;
  final String? description;
  final TopicType type;
  final int? parentId;
  final Map<String, dynamic>? content;
  final DateTime createdAt;
  final DateTime updatedAt;

  TopicModel({
    this.id,
    required this.title,
    this.description,
    required this.type,
    this.parentId,
    this.content,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory TopicModel.fromJson(Map<String, dynamic> json) => _$TopicModelFromJson(json);
  Map<String, dynamic> toJson() => _$TopicModelToJson(this);
}