import 'package:clean_architecture_practice/core/resources/data_state.dart';
import 'package:clean_architecture_practice/features/daily_news/data/models/article.dart';
import 'package:clean_architecture_practice/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() {
    // TODO: implement getNewsArticle
    throw UnimplementedError();
  }
}
