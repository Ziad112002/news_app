import 'package:news/domain/model/article.dart';
import 'package:news/domain/model/source.dart';


abstract class NewsRepository {
  Future<List<Source>> loadNewsSource(String categoryName);

  Future<List<Article>> loadNewsArticles(String sourceId);
}