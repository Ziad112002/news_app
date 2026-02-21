import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article.dart';
import 'package:news/ui/providers/int_extension.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: buildNewsDetails(context),
        );
      },
      child: Container(
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
           child:// Image.network(
              //   article.urlToImage ?? "",
              //   height: context.height * .25,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              //
              // ),
              CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                errorWidget: (context, url, error) => const Icon(Icons.error_outline, color: Colors.red),
                height: context.height * .25,
                width: double.infinity,
                fit: BoxFit.cover,

              ),
            ),
            10.verticalSpace(),
            Text(
              article.title ?? "",
              textAlign: .start,
              style: context.textTheme.bodyLarge,
            ),
            10.verticalSpace(),

            Row(
              children: [
                Expanded(
                  child: Text(
                    "By : ${article.author}",
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                Text(
                  "${article.publishedAt}",
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  WidgetBuilder buildNewsDetails(BuildContext context) {
    return (context) => Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
            child: Image.network(
              article.urlToImage ?? "",
              height: context.height * .25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          10.verticalSpace(),
          Expanded(
            child: Text(
              article.description ?? "",
              textAlign: .start,
              overflow: .ellipsis,
              maxLines: 5,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.primaryColor,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              openMyLink(article.url??"");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
            child: Text(
              "View Full Article",
              style: context.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
  Future<void> openMyLink(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
         await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw "couldn't launch the url";
      }
    } on Exception catch (e) {
      throw"An error occurred: $e" ;
    }
  }
}
