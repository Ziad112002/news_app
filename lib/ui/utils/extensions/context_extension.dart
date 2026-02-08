import 'package:flutter/material.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext{
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeProvider get themeProvider => Provider.of(this);
  double get width=>MediaQuery.of(this).size.width;
  double get height=>MediaQuery.of(this).size.height;
}