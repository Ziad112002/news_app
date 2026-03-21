import 'package:injectable/injectable.dart';
import 'package:news/data/models/remote_article.dart';
import 'package:news/data/models/remote_source.dart';
import 'package:news/domain/model/article.dart';
import 'package:news/domain/model/source.dart';
@injectable
class Mapper {
  Source toSource(RemoteSource remoteSource){
    return Source(remoteSource.id??"", remoteSource.name??"");
  }
  List<Source> toSources(List<RemoteSource> remoteSources){
    List<Source> sources=remoteSources.map((remoteSource)=>toSource(remoteSource)).toList();
    return sources ;
  }
  Article toArticle(RemoteArticle article){
    return Article(toSource(article.source!), article.author??"Unknown", article.title??"", article.description??"", article.url??"", article.urlToImage??"", article.publishedAt??"", article.content??"");
  }
  List<Article> toArticles(List<RemoteArticle> articles){
    return articles.map((article)=>toArticle(article)).toList();
  }
}