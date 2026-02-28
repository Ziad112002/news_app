import 'package:news/domain/model/source.dart';
import 'package:news/domain/repository/news_repository.dart';

class LoadSourceUseCase {
  NewsRepository newsRepository;
  LoadSourceUseCase({required this.newsRepository});
  Future<List<Source>>call(String category){
    return newsRepository.loadNewsSource(category);

  }
}
//clean architecture layers or cycle
// Widget -> view model -> use case -> repository -> data source