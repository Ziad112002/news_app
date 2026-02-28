import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news/data/mapper/mapper.dart';
import 'package:news/data/repository/news_repository/data_articles/local_data_articles.dart';
import 'package:news/data/repository/news_repository/data_articles/remote_data_articles.dart';
import 'package:news/data/repository/news_repository/data_sources/local_data_source.dart';
import 'package:news/data/repository/news_repository/data_sources/remote_data_source.dart';
import 'package:news/data/models/article.dart';
import 'package:news/data/models/remote_source.dart';
import 'package:news/domain/model/source.dart';

class NewsRepository {
  RemoteDataSource remoteDataSource=RemoteDataSource();
  LocalDataSource localDataSource=LocalDataSource();
  Connectivity connectivity=Connectivity();
  RemoteDataArticles remoteDataArticles=RemoteDataArticles();
  Mapper mapper=Mapper();
LocalDataArticles localDataArticles=LocalDataArticles();
   Future<List<Source>> loadNewsSource(String categoryName) async {
     final List<ConnectivityResult> connectivityResult = await (connectivity.checkConnectivity());
     if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
       var remoteSources =await remoteDataSource.loadNewsSource(categoryName);
       localDataSource.saveSources(categoryName,remoteSources);
       var sources= mapper.toSources(remoteSources);
       return sources;
     }else{
       var remoteSources =await localDataSource.loadNewsSource(categoryName);
       var sources= mapper.toSources(remoteSources??[]);
      return  sources;
     }
   }
   Future<List<Article>> loadNewsArticles(String sourceId) async {
     final List<ConnectivityResult> connectivityResult = await (connectivity.checkConnectivity());
     if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
       var articles =await remoteDataArticles.loadNewsArticles(sourceId);
      localDataArticles.saveArticles(sourceId, articles);
      Article.currentArticles=articles;
       return articles;
     }else{
       var articles =await localDataArticles.loadNewsArticles(sourceId);
       Article.currentArticles=articles??[];
       return  articles??[];
     }

  }


}