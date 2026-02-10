import 'package:dio/dio.dart';
import 'package:news/models/article.dart';
import 'package:news/models/article_response.dart';
import 'package:news/models/source.dart';
import 'package:news/models/sources_response.dart';

abstract final class ApiManager {
  static const apiKey="a291690d154149569a2beed9c32a3662";
  static const baseUrl="https://newsapi.org/";
  static const sourceEndpoint="v2/top-headlines/sources";
  static const articleEndpoint="v2/everything";
 static Future<List<Source>>loadNewsSource()async{
    final dio =Dio();
   Response response= await dio.get("$baseUrl$sourceEndpoint?apiKey=$apiKey");
   if(response.statusCode!>=200&& response.statusCode!<300){
     Map<String,dynamic> json=response.data;
     SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
     return sourcesResponse.sources!;
   }
   throw "Something Went Wrong Please Try Again Later!!!";
  }
  static Future<List<Article>>loadNewsArticles(String sourceId)async{
    final dio =Dio();
    Response response= await dio.get("$baseUrl$articleEndpoint?sources=$sourceId&apiKey=a291690d154149569a2beed9c32a3662");
    if(response.statusCode!>=200&& response.statusCode!<300){
      Map<String,dynamic> json=response.data;
      ArticleResponse articleResponse=ArticleResponse.fromJson(json);
      return articleResponse.articles!;
    }
    throw "Something Went Wrong Please Try Again Later!!!";
  }
}