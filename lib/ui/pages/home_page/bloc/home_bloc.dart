
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:everything/data/enums/topic_type_enum.dart';
import 'package:everything/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:everything/data/daos/topics_dao.dart';
import 'package:everything/data/database.dart';
import 'package:everything/data/models/topic_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TopicsDao _topicsDao = getIt<TopicsDao>();

  HomeBloc() : super(HomeInitial()) {
    on<LoadTopics>(_onLoadTopics);
    on<AddTopic>(_onAddTopic);
  }

  Future<void> _onLoadTopics(LoadTopics event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      // Подписываемся на изменения (реактивность Drift)
      final Stream<List<Topic>>  query = _topicsDao.watchAllTopics();
      await emit.forEach<List<Topic>>(
        query,
        onData: (topics) {
          return HomeLoaded(
            topics.map((t) => TopicModel(
              id: t.id,
              title: t.title,
              description: t.description,
              type: t.type,
              parentId: t.parentId,
              content: t.content,
              createdAt: t.createdAt,
              updatedAt: t.updatedAt,
            )).toList(),
          );
        },
      );
    } catch (e) {
      log(e.toString());
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onAddTopic(AddTopic event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded) {
      try {
        await _topicsDao.insertTopic(
          TopicsCompanion.insert(
            title: event.title,
            description: Value(event.description),
            type: event.type,
            parentId: Value(event.parentId),
            content: Value(event.content),
          ),
        );
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    }
  }
}