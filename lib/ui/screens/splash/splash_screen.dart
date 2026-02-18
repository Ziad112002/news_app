import 'package:flutter/material.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:news/ui/utils/app_assets.dart';
import 'package:news/ui/utils/app_routes.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, AppRoutes.categoriesScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of(context);
    return Scaffold(
      body: Image.asset(
        provider.isLightMode ? AppAssets.splash : AppAssets.splashDark,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
