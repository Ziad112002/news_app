import 'package:injectable/injectable.dart';
import 'package:news/domain/model/article.dart';
import 'package:news/domain/repository/news_repository.dart';

@injectable
class LoadArticlesUseCase {
  final NewsRepository _newsRepository;
  LoadArticlesUseCase(this._newsRepository);
  Future<List<Article>>call(String sourceId)async{
    return _newsRepository.loadNewsArticles(sourceId);
  }
}