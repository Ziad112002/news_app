import 'package:news/data/repository/news_repository/news_repository.dart';
import 'package:news/data/models/remote_source.dart';

class LoadSourceUseCase {
  NewsRepository newsRepository=NewsRepository();
  Future<List<RemoteSource>>call(String category){
    return newsRepository.loadNewsSource(category);

  }
}
//clean architecture layers or cycle
// Widget -> view model -> use case -> repository -> data source