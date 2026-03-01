import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
@module
abstract class ConnectivityModule{
  Connectivity getConnectivity()=> Connectivity();
}
// any package i install in project must be module to make injectable generator create it
// ex connectivity , hive and shared prefs