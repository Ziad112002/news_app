import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/mapper/sources_mapper.dart';
import 'package:news/data/repository/news_repository/data_articles/local_data_articles.dart';
import 'package:news/data/repository/news_repository/data_articles/remote_data_articles.dart';
import 'package:news/data/repository/news_repository/data_sources/local_data_source.dart';
import 'package:news/data/repository/news_repository/data_sources/remote_data_source.dart';
import 'package:news/data/models/article.dart';
import 'package:news/domain/model/source.dart';
import 'package:news/domain/repository/news_repository.dart';
@Injectable(as:  NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  RemoteDataSource remoteDataSource;
  LocalDataSource localDataSource;
  Connectivity connectivity ;
  SourcesMapper mapper ;
  RemoteDataArticles remoteDataArticles = RemoteDataArticles();
  LocalDataArticles localDataArticles = LocalDataArticles();
  NewsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.connectivity,
    required this.mapper,
  });
  @override
  Future<List<Source>> loadNewsSource(String categoryName) async {
    final List<ConnectivityResult> connectivityResult = await (connectivity
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var remoteSources = await remoteDataSource.loadNewsSource(categoryName);
      localDataSource.saveSources(categoryName, remoteSources);
      var sources = mapper.toSources(remoteSources);
      return sources;
    } else {
      var remoteSources = await localDataSource.loadNewsSource(categoryName);
      var sources = mapper.toSources(remoteSources ?? []);
      return sources;
    }
  }


}
class NewsArticleRepository{
  RemoteDataArticles remoteDataArticles = RemoteDataArticles();
  LocalDataArticles localDataArticles = LocalDataArticles();
  Connectivity connectivity =Connectivity();
  Future<List<Article>> loadNewsArticles(String sourceId) async {
    final List<ConnectivityResult> connectivityResult = await (connectivity
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var articles = await remoteDataArticles.loadNewsArticles(sourceId);
      localDataArticles.saveArticles(sourceId, articles);
      Article.currentArticles = articles;
      return articles;
    } else {
      var articles = await localDataArticles.loadNewsArticles(sourceId);
      Article.currentArticles = articles ?? [];
      return articles ?? [];
    }
  }
}
