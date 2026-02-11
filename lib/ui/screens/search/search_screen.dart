import 'package:flutter/material.dart';
import 'package:news/ui/providers/int_extension.dart';
import 'package:news/ui/utils/app_assets.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import '../../../apis/api_manager.dart';
import '../../../models/article.dart';
import '../../../models/source.dart';
import '../navigation/tabs/news/news_card.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = "";
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
            Expanded(child: buildFilteredListView(Source.currentNewsId??""))
          ],
        ),
      ),
    );
  }

 Widget buildTextField(BuildContext context) {
    var border=OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 1,
        color: context.secondaryColor
      )
    );
      return TextField(
        onChanged: (value){
          setState(() {
            _searchQuery = value.toLowerCase();
          });
        },
         decoration: InputDecoration(
             hintText: "Search",
             hintStyle: context.textTheme.labelMedium,
             prefixIcon: ImageIcon(AssetImage(AppAssets.searchIcon),color:context.secondaryColor ,),
             suffixIcon: IconButton(
                 onPressed: () {
                       Navigator.pop(context);
                 },icon: Icon(Icons.close_rounded,color:context.secondaryColor ,)),

           border: border,
           enabledBorder: border,
           disabledBorder: border,
           focusedBorder: border
         ),
               );
 }

 Widget buildFilteredListView(String sourceId){
    return  FutureBuilder(
        future: ApiManager.loadNewsArticles(sourceId),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return   Center(child: Text(snapshot.error.toString(),style:context.textTheme.labelLarge,),);

          }
          else if (snapshot.hasData) {
            List<Article> articles=snapshot.data!;
            List<Article> filteredArticles = articles.where((article) {
              final title = article.title?.toLowerCase() ?? "";
              return title.contains(_searchQuery);
            }).toList();

            if (filteredArticles.isEmpty) {
              return const Center(child: Text("No articles found."));
            }
            return ListView.builder(
                itemCount:filteredArticles.length,
                itemBuilder: (context,index){
                  return NewsCard(article: filteredArticles[index],);
                });
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
    );
 }
}
