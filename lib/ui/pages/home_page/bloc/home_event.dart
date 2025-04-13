part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadTopics extends HomeEvent {}

class AddTopic extends HomeEvent {
  final String title;
  final String? description;
  final TopicType type;
  final int? parentId;
  final Map<String, dynamic>? content;

  AddTopic({
    required this.title,
    this.description,
    required this.type,
    this.parentId,
    this.content,
  });
}