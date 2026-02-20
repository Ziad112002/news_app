import 'package:news/apis/api_manager.dart';
import 'package:news/models/source.dart';

class RemoteDataSource {
  Future<List<Source>> loadNewsSource(String categoryName) async {
    return ApiManager.loadNewsSource(categoryName);
  }
}