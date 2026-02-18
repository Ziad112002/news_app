import 'package:flutter/material.dart';
import 'package:news/ui/screens/categories/categories_screen.dart';
import 'package:news/ui/screens/navigation/navigation_screen.dart';
import 'package:news/ui/screens/search/search_screen.dart';

abstract final class AppRoutes {
  static MaterialPageRoute navigationScreen(String categoryName) =>
      MaterialPageRoute(builder: (_) => NavigationScreen(categoryName));
  static MaterialPageRoute get searchScreen =>
      MaterialPageRoute(builder: (_) => SearchScreen());
  static MaterialPageRoute get categoriesScreen =>
      MaterialPageRoute(builder: (_) => CategoriesScreen());
}
