import 'package:flutter/material.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:news/ui/screens/navigation/tabs/news/news_tab.dart';
import 'package:news/ui/utils/app_assets.dart';
import 'package:news/ui/utils/app_routes.dart';
import 'package:news/ui/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen(this.categoryName, {super.key});
  final String categoryName;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, AppRoutes.searchScreen);
            },
            icon: ImageIcon(AssetImage(AppAssets.searchIcon)),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: NewsTab(widget.categoryName),
    );
  }
}
