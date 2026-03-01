import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/data/models/article_response.dart';
import 'package:news/data/models/sources_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@RestApi()
@injectable
abstract class ApiClient {
  @factoryMethod
factory ApiClient(Dio dio,) = _ApiClient;

@GET('v2/top-headlines/sources')
Future<SourcesResponse> loadNewsSource(
    @Query("category")String category,@Query("apiKey")String apiKey
    );
  @GET('v2/everything')

Future<ArticleResponse> loadNewsArticle(
    @Query("sources")String sourceId,@Query("apiKey")String apiKey
    );
}
