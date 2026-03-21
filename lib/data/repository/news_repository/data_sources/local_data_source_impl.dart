import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/models/remote_article.dart';
import 'package:news/data/models/remote_source.dart';
import 'local_data_source.dart';
@Injectable(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource {
  String boxName = "news";
  @override
  Future<List<RemoteSource>?> loadNewsSource(String categoryName) async {
    var box = await Hive.openBox(boxName);
    final data = box.get(categoryName);
    if (data == null) return null;
    List<RemoteSource>? sources = (data as List<dynamic>).cast<RemoteSource>();
    return sources;
  }
  @override
  Future<void> saveSources(String category, List<RemoteSource> sources) async {
    var box = await Hive.openBox(boxName);
    box.put(category, sources);
  }
  @override
  Future<List<RemoteArticle>?> loadNewsArticles(String sourceId) async {
    var box = await Hive.openBox(boxName);
    final data = box.get(sourceId);
    if (data == null) return null;
    List<RemoteArticle>? articles = (data as List<dynamic>).cast<RemoteArticle>();

    return articles;
  }
  @override
  Future<void> saveArticles(String sourceId, List<RemoteArticle> articles) async {
    var box = await Hive.openBox(boxName);
    box.put(sourceId, articles);
  }

}

