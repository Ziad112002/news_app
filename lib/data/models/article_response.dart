import 'article.dart';

class ArticleResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ArticleResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((e) => e.toJson()).toList(),
    }..removeWhere((key, value) => value == null); // optional: clean nulls
  }
}


