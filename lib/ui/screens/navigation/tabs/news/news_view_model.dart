import 'package:flutter/material.dart';
import '../../../../../apis/api_manager.dart';
import '../../../../../models/source.dart';

class NewsViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading=false;
  String errorMessage="";
  Future<void> loadSources(String categoryName) async {
    try {
      isLoading=true;
      sources = await ApiManager.loadNewsSource(categoryName);
      isLoading=false;
    } on Exception catch (e) {
      isLoading=false;
      errorMessage=e.toString();
    }
    notifyListeners();
  }
}
