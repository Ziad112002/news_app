import 'package:news/apis/api_manager.dart';
import 'package:news/data/models/article.dart';

class RemoteDataArticles {
   Future<List<Article>> loadNewsArticles(String sourceId) async {
   return  ApiManager.loadNewsArticles(sourceId);
  }

}