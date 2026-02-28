import 'package:news/apis/api_manager.dart';
import 'package:news/data/models/remote_source.dart';

class RemoteDataSource {
  Future<List<RemoteSource>> loadNewsSource(String categoryName) async {
    return ApiManager.loadNewsSource(categoryName);
  }
}