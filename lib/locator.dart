import 'package:finance_digest/core/app_config/dio/dio_client.dart';
import 'package:finance_digest/src/domain/repos/auth_repo.dart';
import 'package:finance_digest/src/domain/repos/news_repo.dart';
import 'package:finance_digest/src/service/local_storage_service.dart';
import 'package:finance_digest/src/service/news_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final lc = GetIt.instance;

Future<void> initializeDependecies() async {
  final prefs = await SharedPreferences.getInstance();
  final dioClient = DioClient();

  lc
    ..registerLazySingleton(() => NewsService(dio: dioClient.dio))
    ..registerLazySingleton(() => LocalStorageService(prefs: prefs))
    ..registerLazySingleton(() => AuthRepo(localStorageService: lc()))
    ..registerLazySingleton(() => NewsRepo(newsService: lc()));
}
