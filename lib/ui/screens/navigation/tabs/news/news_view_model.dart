import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/domain/model/article.dart';
import 'package:news/domain/model/source.dart';
import 'package:news/domain/use_case/load_articles_use_case.dart';
import 'package:news/domain/use_case/load_source_use_case.dart';
import 'package:news/ui/utils/resource.dart';
@injectable
class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel(this._loadSourceUseCase,this._loadArticlesUseCase):super(NewsState(sourceApi: Resource.initial(),articleApi: Resource.initial()));
 final LoadSourceUseCase _loadSourceUseCase;
 final LoadArticlesUseCase _loadArticlesUseCase;


  Future<void> loadSources(String categoryName) async {
    try {
      emit(state.copyWith(sourceApi:Resource.loading()));
    var  sources = await _loadSourceUseCase(categoryName);
      emit(state.copyWith(sourceApi: Resource.success(sources)));

    } on Exception catch (e) {
      emit(state.copyWith(sourceApi: Resource.error(e.toString())));

    }
  }
  Future<void> loadArticles(String sourceId) async {
    try {
      emit(state.copyWith(articleApi:Resource.loading()));
    var  articles = await _loadArticlesUseCase(sourceId);
      emit(state.copyWith(articleApi: Resource.success(articles)));

    } on Exception catch (e) {
      emit(state.copyWith(articleApi: Resource.error(e.toString())));

    }
  }
}
class NewsState{
  late Resource<List<Source>> sourceApi;
  late Resource<List<Article>> articleApi;
NewsState({required this.sourceApi, required this.articleApi});
NewsState.initial(){
  sourceApi=Resource.initial();
  articleApi=Resource.initial();
}
NewsState copyWith({
  Resource<List<Source>>? sourceApi,
  Resource<List<Article>>? articleApi,
}){
  return NewsState(sourceApi: sourceApi??this.sourceApi, articleApi: articleApi??this.articleApi);
}
}
