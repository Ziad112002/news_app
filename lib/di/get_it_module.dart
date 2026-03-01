import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/apis/api_manager.dart';
@module
abstract class GetItModule{
  Connectivity getConnectivity()=> Connectivity();
  Dio getDio()=> Dio(BaseOptions(
    baseUrl: ApiManager.baseUrl
  ));
}
// any package i install in project must be module to make injectable generator create it
// ex connectivity , hive and shared prefs