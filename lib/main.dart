import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/data/repository/news_repository/data_articles/local_data_articles.dart';
import 'package:news/data/repository/news_repository/data_sources/local_data_source.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:news/ui/screens/categories/categories_screen.dart';
import 'package:news/ui/utils/app_themes.dart';
import 'package:provider/provider.dart';

void main() {
  Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(ArticleAdapter());
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: provider.themeMode,
      home: CategoriesScreen(),
    );
  }
}
