import 'dart:convert';
import 'package:drift/drift.dart';

class TopicContentConverter extends TypeConverter<Map<String, dynamic>, String> {
  const TopicContentConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) {
    return Map<String, dynamic>.from(json.decode(fromDb));
  }

  @override
  String toSql(Map<String, dynamic> value) {
    return json.encode(value);
  }
}