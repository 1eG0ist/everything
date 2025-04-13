import 'package:everything/data/daos/topics_dao.dart';
import 'package:everything/data/database.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Регистрируем AppDatabase как синглтон (создастся один раз)
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // Можно сразу зарегистрировать DAO
  getIt.registerFactory(() => TopicsDao(getIt<AppDatabase>()));
}