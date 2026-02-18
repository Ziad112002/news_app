import 'package:flutter/material.dart';
import 'package:news/models/app_category.dart';
import 'package:news/ui/screens/categories/category_card.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import 'package:news/ui/widgets/app_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                "Good Morning\nHere is Some News For You",
                style: context.textTheme.displayMedium,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: AppCategory.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: AppCategory.categories[index],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
