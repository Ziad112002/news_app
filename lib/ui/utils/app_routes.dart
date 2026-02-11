import 'package:flutter/material.dart';
import 'package:news/ui/screens/navigation/navigation_screen.dart';
import 'package:news/ui/screens/search/search_screen.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get navigationScreen =>
      MaterialPageRoute(builder: (_) => NavigationScreen());
  static MaterialPageRoute get searchScreen =>
      MaterialPageRoute(builder: (_) => SearchScreen());
}
