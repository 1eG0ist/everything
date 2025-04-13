import 'package:drift/drift.dart';
import 'package:everything/data/database.dart';
import 'package:everything/data/tables/topics.dart';

part 'topics_dao.g.dart';

@DriftAccessor(tables: [Topics])
class TopicsDao extends DatabaseAccessor<AppDatabase> with _$TopicsDaoMixin {
  TopicsDao(AppDatabase db) : super(db);

  Future<List<Topic>> getAllTopics() => select(topics).get();
  Stream<List<Topic>> watchAllTopics() => select(topics).watch();
  Future<int> insertTopic(TopicsCompanion topic) => into(topics).insert(topic);
  Future<void> deleteTopic(int id) => (delete(topics)..where((t) => t.id.equals(id))).go();
  Future<void> updateTopic(Topic topic) => update(topics).replace(topic);
}