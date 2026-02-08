import 'package:flutter/material.dart';
import 'package:news/ui/screens/navigation/navigation_screen.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get navigationScreen =>
      MaterialPageRoute(builder: (_) => NavigationScreen());
}
