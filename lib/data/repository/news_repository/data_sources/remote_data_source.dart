import 'package:news/apis/api_manager.dart';
import 'package:news/data/models/remote_source.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<List<RemoteSource>> loadNewsSource(String categoryName) async {
    return ApiManager.loadNewsSource(categoryName);
  }

}
abstract class RemoteDataSource {
  Future<List<RemoteSource>> loadNewsSource(String categoryName);
}