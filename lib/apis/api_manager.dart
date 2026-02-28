import 'package:dio/dio.dart';
import 'package:news/data/models/article.dart';
import 'package:news/data/models/article_response.dart';
import 'package:news/data/models/remote_source.dart';
import 'package:news/data/models/sources_response.dart';

abstract final class ApiManager {
  static const apiKey = "f5166805f3194905b31f56ec89dc5728";
  static const baseUrl = "https://newsapi.org/";
  static const sourceEndpoint = "v2/top-headlines/sources";
  static const articleEndpoint = "v2/everything";
  static Future<List<RemoteSource>> loadNewsSource(String categoryName) async {
    final dio = Dio();
    Response response = await dio.get(
      "$baseUrl$sourceEndpoint",queryParameters: {
        "apiKey": apiKey,
        "category": categoryName,
      }
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      Map<String, dynamic> json = response.data;
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse.sources!;
    }
    throw "Something Went Wrong Please Try Again Later!!!";
  }

  static Future<List<Article>> loadNewsArticles(String sourceId) async {
    final dio = Dio();
    Response response = await dio.get(
      "$baseUrl$articleEndpoint?apiKey=$apiKey&sources=$sourceId",
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      Map<String, dynamic> json = response.data;
      ArticleResponse articleResponse = ArticleResponse.fromJson(json);
      return articleResponse.articles!;
    }
    throw "Something Went Wrong Please Try Again Later!!!";
  }
}
