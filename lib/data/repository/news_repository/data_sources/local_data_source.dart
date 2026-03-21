import 'package:news/data/models/remote_article.dart';
import 'package:news/data/models/remote_source.dart';

abstract class LocalDataSource {
  Future<List<RemoteSource>?> loadNewsSource(String categoryName);
  Future<void> saveSources(String category, List<RemoteSource> sources);
  Future<List<RemoteArticle>?> loadNewsArticles(String sourceId);
  Future<void> saveArticles(String sourceId, List<RemoteArticle> articles);
}
