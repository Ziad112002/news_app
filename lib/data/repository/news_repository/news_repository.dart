import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/mapper/sources_mapper.dart';
import 'package:news/domain/model/article.dart';
import 'package:news/domain/model/source.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'data_sources/local_data_source.dart';
import 'data_sources/remote_data_source.dart';
@Injectable(as:  NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final Connectivity _connectivity ;
  final Mapper _mapper ;

  NewsRepositoryImpl({
    required LocalDataSource localDataSource,
    required RemoteDataSource remoteDataSource,
    required Connectivity connectivity,
    required Mapper mapper,
  }) : _mapper = mapper, _connectivity = connectivity, _localDataSource = localDataSource, _remoteDataSource = remoteDataSource;
  @override
  Future<List<Source>> loadNewsSource(String categoryName) async {
    final List<ConnectivityResult> connectivityResult = await (_connectivity
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var remoteSources = await _remoteDataSource.loadNewsSource(categoryName);
      _localDataSource.saveSources(categoryName, remoteSources);
      var sources = _mapper.toSources(remoteSources);
      return sources;
    } else {
      var remoteSources = await _localDataSource.loadNewsSource(categoryName);
      var sources = _mapper.toSources(remoteSources ?? []);
      return sources;
    }
  }

  @override
  Future<List<Article>> loadNewsArticles(String sourceId) async {
    final List<ConnectivityResult> connectivityResult = await (_connectivity
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var result = await _remoteDataSource.loadNewsArticles(sourceId);
      _localDataSource.saveArticles(sourceId, result);
      Article.currentArticles = _mapper.toArticles(result);
      List<Article> articles=_mapper.toArticles(result);
      return articles;
    } else {
      var result = await _localDataSource.loadNewsArticles(sourceId);
      Article.currentArticles = _mapper.toArticles(result??[]) ;
      List<Article> articles=_mapper.toArticles(result??[]);
      return articles ;
    }
  }
}

