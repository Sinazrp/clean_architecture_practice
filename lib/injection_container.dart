import 'package:clean_architecture_practice/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_practice/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_practice/features/daily_news/data/repository/article_repository_implementation.dart';
import 'package:clean_architecture_practice/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture_practice/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture_practice/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  //DIO
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsAiServicec>(NewsAiServicec(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //useCase
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
