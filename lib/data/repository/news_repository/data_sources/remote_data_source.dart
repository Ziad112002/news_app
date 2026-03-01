import 'package:injectable/injectable.dart';
import 'package:news/apis/api_client.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/data/models/remote_source.dart';
import 'package:news/data/models/sources_response.dart';
@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl extends RemoteDataSource {
  ApiClient apiClient;
  RemoteDataSourceImpl(this.apiClient);
  @override
  Future<List<RemoteSource>> loadNewsSource(String categoryName) async {
    SourcesResponse sourcesResponse= await apiClient.loadNewsSource(categoryName,ApiManager.apiKey);
    List<RemoteSource> sources=sourcesResponse.sources!;
    return sources;
  }

}
abstract class RemoteDataSource {
  Future<List<RemoteSource>> loadNewsSource(String categoryName);
}