import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/ui/utils/resource.dart';
import '../../../../../apis/api_manager.dart';
import '../../../../../models/source.dart';

class NewsViewModel extends Cubit<NewsState> {

  // Resource<List<Source>> sourceApi=Resource.initial();
  NewsViewModel():super(NewsState(Resource.initial()));

  Future<void> loadSources(String categoryName) async {
    try {
      // sourceApi=Resource.loading();                    //  comments using Provider and actually code using Cubit
      // notifyListeners();// Using Provider
      emit(NewsState(Resource.loading()));
    var  sources = await ApiManager.loadNewsSource(categoryName);
    // sourceApi=Resource.success(sources);// Using Provider
      emit(NewsState(Resource.success(sources)));

    } on Exception catch (e) {
    // sourceApi=Resource.error(e.toString());  // Using Provider
      emit(NewsState(Resource.error(e.toString())));

    }
    // notifyListeners();
  }
}
class NewsState{
  Resource<List<Source>> sourceApi=Resource.initial();
NewsState(this.sourceApi);
}
