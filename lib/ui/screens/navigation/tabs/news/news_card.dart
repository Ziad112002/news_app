import 'package:flutter/material.dart';
import 'package:news/ui/providers/int_extension.dart';
import 'package:news/ui/utils/app_assets.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.primaryColor,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(width: 2, color: context.secondaryColor),
      ),
      child: Column(
        children: [
          ClipRRect( 
            borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
            child: Image.asset(
                context.themeProvider.isLightMode
                    ? AppAssets.splashDark
                    : AppAssets.splash,
                height: context.height*.25,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
          ),
          10.verticalSpace(),
          Text(
            "40-year-old man falls 200 feet to his death while canyoneering at national park",
            style: context.textTheme.bodyLarge,
          ),
          10.verticalSpace(),

          Row(
            children: [
              Expanded(child: Text("By : Jon Haworth",style: context.textTheme.bodyMedium,)),
              Text("15 minutes ago",style: context.textTheme.bodyMedium,)
            ],
          )
        ],
      ),
    );
  }
}
