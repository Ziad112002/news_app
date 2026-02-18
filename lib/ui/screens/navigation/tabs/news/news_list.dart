import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/models/article.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';

import 'news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.sourceId});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.loadNewsArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: context.textTheme.labelLarge,
            ),
          );
        } else if (snapshot.hasData) {
          List<Article> articles = snapshot.data!;
          if (articles.isEmpty) {
            return Center(
              child: Text(
                "No news found",
                style: context.textTheme.displayMedium,
              ),
            );
          }
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsCard(article: articles[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
