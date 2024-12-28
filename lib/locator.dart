import 'package:finance_digest/core/app_config/dio/dio_client.dart';
import 'package:finance_digest/src/domain/repos/news_repo.dart';
import 'package:finance_digest/src/service/news_service.dart';
import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final lc = GetIt.instance;

Future<void> initializeDependecies() async {
  // final prefs = await SharedPreferences.getInstance();
  final dioClient = DioClient();

  lc
    ..registerLazySingleton(() => NewsService(dio: dioClient.dio))
    ..registerLazySingleton(() => NewsRepo(newsService: lc()));
}
