import 'dart:io';

import 'package:clean_architecture_practice/core/constants/constants.dart';
import 'package:clean_architecture_practice/core/resources/data_state.dart';
import 'package:clean_architecture_practice/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_practice/features/daily_news/data/models/article.dart';
import 'package:clean_architecture_practice/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsAiServicec _newsAiServicec;

  ArticleRepositoryImpl(this._newsAiServicec);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsAiServicec.getNewsArticles(
          apiKey: apiKey, category: category, country: country);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFaild(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFaild(e);
    }
  }
}
