import 'package:everything/data/enums/topic_type_enum.dart';
import 'package:everything/data/models/topic_model.dart';
import 'package:everything/ui/widgets/dialogs/create_topic_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomePageLayout extends StatefulWidget {
  const HomePageLayout({super.key});

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc()..add(LoadTopics());
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.surface,
          body: _buildBody(state),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddTopicDialog(_homeBloc), // Передаем bloc явно
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _buildBody(HomeState state) {
    if (state is HomeLoading) return const Center(child: CircularProgressIndicator());
    if (state is HomeError) return Center(child: Text('Ошибка: ${state.message}'));
    if (state is HomeLoaded) return _buildTopicsList(state.topics);
    return const Center(child: Text('Начните добавлять заметки'));
  }

  void _showAddTopicDialog(HomeBloc bloc) {
    showDialog(
      context: context,
      builder: (context) => CreateTopicDialog(
        onCreate: (title, description, type) {
          _homeBloc.add(AddTopic(
            title: title,
            description: description,
            type: type,
          ));
        },
      ),
    );
  }

  Widget _buildTopicsList(List<TopicModel> topics) {
    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) {
        final topic = topics[index];
        return ListTile(
          title: Text(topic.title),
          subtitle: topic.description != null ? Text(topic.description!) : null,
          trailing: Icon(topic.type == TopicType.folder
              ? Icons.folder_copy_outlined
              : Icons.sticky_note_2_outlined),
        );
      },
    );
  }
}