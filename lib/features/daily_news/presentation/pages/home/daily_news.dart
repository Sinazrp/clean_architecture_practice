import 'package:clean_architecture_practice/features/daily_news/presentation/widget/article_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily News"),
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state is RemoteArticlesLoading) {
            const CircularProgressIndicator();
          }
          if (state is RemoteArticlesError) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          }
          if (state is RemoteArticlesDone) {
            return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, index) {
                return ArticleWidget(
                  article: state.articles![index],
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
