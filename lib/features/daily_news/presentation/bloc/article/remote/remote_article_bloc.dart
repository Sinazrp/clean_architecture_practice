import 'package:clean_architecture_practice/core/resources/data_state.dart';
import 'package:clean_architecture_practice/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture_practice/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture_practice/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticleEvent>(onGetArticleEvent);
  }

  void onGetArticleEvent(
      GetArticleEvent event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is DataFaild) {
      print(dataState.error!.message);
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
