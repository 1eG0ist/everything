import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:everything/data/daos/topics_dao.dart';
import 'package:everything/data/tables/topics.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:everything/data/enums/topic_type_enum.dart';
import 'package:everything/data/data_converters/topic_content_converter.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Topics], daos: [TopicsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      return NativeDatabase.createInBackground(file);
    });
  }
}