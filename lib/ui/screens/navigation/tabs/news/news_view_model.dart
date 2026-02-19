import 'package:flutter/material.dart';
import 'package:news/ui/utils/rsource.dart';
import '../../../../../apis/api_manager.dart';
import '../../../../../models/source.dart';

class NewsViewModel extends ChangeNotifier {
  // List<Source> sources = [];
  // bool isLoading=false;
  // String errorMessage="";
  Resource<List<Source>> sourceApi=Resource.initial();
  Future<void> loadSources(String categoryName) async {
    try {
      // isLoading=true;
      sourceApi=Resource.loading();
      notifyListeners();
    var  sources = await ApiManager.loadNewsSource(categoryName);
    sourceApi=Resource.success(sources);
    } on Exception catch (e) {
    sourceApi=Resource.error(e.toString());
    }
    notifyListeners();
  }
}
