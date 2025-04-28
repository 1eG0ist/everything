import 'package:everything/data/enums/topic_type_enum.dart';
import 'package:everything/data/models/topic_model.dart';
import 'package:everything/ui/widgets/cards/topic_card.dart';
import 'package:everything/ui/widgets/dialogs/create_topic_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/buttons/glass_depressed_fab.dart';
import '../bloc/home_bloc.dart';

class HomePageLayout extends StatefulWidget {
  const HomePageLayout({super.key});

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  late final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    print("Loading");
    _homeBloc.add(LoadTopics());
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

          body: SafeArea(
            child: switch (state) {
              HomeLoading() => const Center(child: CircularProgressIndicator()),
              HomeError(message: var message) => Center(child: Text('Ошибка: $message')),
              HomeLoaded(topics: var topics) => _buildTopicsList(topics),
              _ => const Center(child: Text('Начните добавлять заметки'))
            },
          ),

          floatingActionButton: GlassDepressedFab(
            onPressed: () => _showAddTopicDialog(_homeBloc),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
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
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      itemCount: topics.length,
      separatorBuilder: (context, index) => SizedBox(height: 4),
      itemBuilder: (context, index) {
        final topic = topics[index];
        return TopicCard(
          title: topic.title,
          description: topic.description,
          type: topic.type,
          createdAt: topic.createdAt,
          updatedAt: topic.updatedAt,
          onTap: () {
            print("Tapped: ${topic.title}");
            // Обработка нажатия
          },
        );
      },
    );
  }
}