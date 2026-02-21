import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news/data/repository/news_repository/data_articles/local_data_articles.dart';
import 'package:news/data/repository/news_repository/data_articles/remote_data_articles.dart';
import 'package:news/data/repository/news_repository/data_sources/local_data_source.dart';
import 'package:news/data/repository/news_repository/data_sources/remote_data_source.dart';
import 'package:news/models/article.dart';
import 'package:news/models/source.dart';

class NewsRepository {
  RemoteDataSource remoteDataSource=RemoteDataSource();
  LocalDataSource localDataSource=LocalDataSource();
  Connectivity connectivity=Connectivity();
  RemoteDataArticles remoteDataArticles=RemoteDataArticles();
LocalDataArticles localDataArticles=LocalDataArticles();
   Future<List<Source>> loadNewsSource(String categoryName) async {
     final List<ConnectivityResult> connectivityResult = await (connectivity.checkConnectivity());
     if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
       var sources =await remoteDataSource.loadNewsSource(categoryName);
       localDataSource.saveSources(categoryName,sources);
       return sources;
     }else{
       var sources =await localDataSource.loadNewsSource(categoryName);
      return  sources??[];
     }
   }
   Future<List<Article>> loadNewsArticles(String sourceId) async {
     final List<ConnectivityResult> connectivityResult = await (connectivity.checkConnectivity());
     if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
       var articles =await remoteDataArticles.loadNewsArticles(sourceId);
      localDataArticles.saveArticles(sourceId, articles);
       return articles;
     }else{
       var articles =await localDataArticles.loadNewsArticles(sourceId);
       return  articles??[];
     }

  }


}