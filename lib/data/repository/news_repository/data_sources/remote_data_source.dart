import 'package:news/data/models/remote_article.dart';
import 'package:news/data/models/remote_source.dart';


abstract class RemoteDataSource {
  Future<List<RemoteSource>> loadNewsSource(String categoryName);
  Future<List<RemoteArticle>> loadNewsArticles(String sourceId);
}