import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di/di.dart';
import 'package:news/ui/screens/navigation/tabs/news/news_view_model.dart';
import 'package:news/ui/utils/app_colors.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import 'package:news/ui/utils/resource.dart';
import 'news_card.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.sourceId});
final String sourceId;
  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
   late final  NewsViewModel _articleViewModel=getIt();
  @override
  void initState() {
    super.initState();
    _articleViewModel.loadArticles(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel,NewsState>(
      bloc: _articleViewModel,
        builder: (context,state){
          final articleState=state.articleApi.status;
          if(articleState==AppStatus.loading){
            return Center(child: CircularProgressIndicator(color: AppColors.white,),);
          }else if(articleState==AppStatus.success&&state.articleApi.data!=null){
            final articles=state.articleApi.data;
            if(articles!.isEmpty) {
              return Center(
                child: Text(
                    "No news articles found right now.",
                  style: context.textTheme.displayMedium,
                ),
              );
            }
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return NewsCard(article: articles[index]);
              },
            );

          }else{
            return Center(
                child: Text(
                state.articleApi.errorMessage ?? "error!",
                style: context.textTheme.bodyLarge,
            )
            );
          }

    });
  }
}
