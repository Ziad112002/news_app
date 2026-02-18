import 'package:flutter/material.dart';
import 'package:news/models/app_category.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:news/ui/utils/app_routes.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.index});
  final AppCategory category;
  final int index;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRoutes.navigationScreen(category.name));
      },
      child: Container(
        height: context.height * .25,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: AssetImage(
              themeProvider.isLightMode
                  ? category.darkImageUrl
                  : category.lightImageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: index.isEven
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              category.name,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            buildViewAllContainer(context, index),
          ],
        ),
      ),
    );
  }

  Widget buildViewAllContainer(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        color: context.primaryColor.withAlpha(125),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index.isEven) ...[
            SizedBox(width: 16),
            Text("View all", style: context.textTheme.displayMedium),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 24,
              backgroundColor: context.primaryColor,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.secondaryColor,
                size: 18,
              ),
            ),
          ],
          if (index.isOdd) ...[
            CircleAvatar(
              radius: 24,
              backgroundColor: context.primaryColor,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: context.secondaryColor,
                size: 18,
              ),
            ),
            SizedBox(width: 8),
            Text("View all", style: context.textTheme.displayMedium),
            SizedBox(width: 16),
          ],
        ],
      ),
    );
  }
}
