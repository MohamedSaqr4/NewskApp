import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/api/api_consumer.dart';
import 'package:news_app/core/api/dio_consumer.dart';
import 'package:news_app/features/home/data/repos/news_repo.dart';
import 'package:news_app/features/search_result/data/repos/search_result_repo.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // ApiConsumer (using DioConsumer implementation)
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl<Dio>()));

  // NewsRepository
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepository(sl<ApiConsumer>()));

  // SearchResultRepository
  sl.registerLazySingleton<SearchResultRepository>(
      () => SearchResultRepository(sl<ApiConsumer>()));
}
