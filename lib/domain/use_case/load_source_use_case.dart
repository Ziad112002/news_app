import 'package:news/data/repository/news_repository/news_repository.dart';
import 'package:news/domain/model/source.dart';

class LoadSourceUseCase {
  NewsRepository newsRepository=NewsRepository();
  Future<List<Source>>call(String category){
    return newsRepository.loadNewsSource(category);

  }
}
//clean architecture layers or cycle
// Widget -> view model -> use case -> repository -> data source