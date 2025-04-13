import 'package:drift/drift.dart';
import 'package:everything/data/data_converters/topic_content_converter.dart';
import 'package:everything/data/enums/topic_type_enum.dart';

class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  TextColumn get type => textEnum<TopicType>()();
  TextColumn get content => text().nullable().map(const TopicContentConverter())();
  IntColumn get parentId => integer().nullable().references(Topics, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}