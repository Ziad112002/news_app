import 'package:flutter/material.dart';
import 'package:news/models/article.dart';
import 'package:news/ui/providers/int_extension.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key,required this.article});
  final Article article;

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
            child: Image.network(
               article.urlToImage??"",
                height: context.height*.25,
              width: double.infinity,
              fit: BoxFit.contain,
              ),
          ),
          10.verticalSpace(),
          Text(
            article.title??"",
            textAlign: .start,
            style: context.textTheme.bodyLarge,
          ),
          10.verticalSpace(),

          Row(
            children: [
              Expanded(child: Text("By : ${article.author}",style: context.textTheme.bodyMedium,)),
              Text("${article.publishedAt}",style: context.textTheme.bodyMedium,)
            ],
          )
        ],
      ),
    );
  }
}
