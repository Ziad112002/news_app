import 'package:flutter/material.dart';
import 'package:news/ui/providers/int_extension.dart';
import 'package:news/ui/utils/app_assets.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import '../../../data/models/article.dart';
import '../navigation/tabs/news/news_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Article> filteredArticles = Article.currentArticles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: buildTextField(context),
            ),
            4.verticalSpace(),
            Expanded(
              child: filteredArticles.isNotEmpty?ListView.builder(
                itemCount: filteredArticles.length,
                itemBuilder: (context, index) {
                  return NewsCard(article: filteredArticles[index]);
                },
              ): Center(
                child: Text("No news articles found right now.",style: context.textTheme.displayMedium),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: context.secondaryColor),
    );
    return TextField(
      onChanged: (value) {
        setState(() {
          if(value.trim().isEmpty){
            filteredArticles=Article.currentArticles;
          }else{
            filteredArticles = Article.currentArticles.where((article) {
              final title = article.title?.toLowerCase() ?? "";
              return title.contains(value);
            }).toList();
          }

        });
      },
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: context.textTheme.labelMedium,
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.searchIcon),
          color: context.secondaryColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close_rounded, color: context.secondaryColor),
        ),

        border: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

}
