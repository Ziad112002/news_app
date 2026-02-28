import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/model/source.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import 'package:news/ui/utils/resource.dart';
import 'news_list.dart';
import 'news_view_model.dart';

class NewsTab extends StatefulWidget {
  const NewsTab(this.categoryName, {super.key});
  final String categoryName;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.categoryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(
        builder: (context, state) {
          if (state.sourceApi.status == AppStatus.loading) {
            return Center(
              child: CircularProgressIndicator(color: context.secondaryColor),
            );
          } else if (state.sourceApi.status == AppStatus.error) {
            return Center(
              child: Text(
                state.sourceApi.errorMessage ?? "error!",
                style: context.textTheme.bodyLarge,
              ),
            );
          } else {
            return buildTabBarList(state.sourceApi.data ?? []);
          }
        },
      ),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => NewsViewModel(),
    //   child: Consumer<NewsViewModel>(
    //     builder: (context,viewModel,_){
    //       this.viewModel=viewModel;
    //       if(viewModel.sourceApi.status==AppStatus.loading){
    //         return Center(
    //           child: CircularProgressIndicator(  // this code using Provider
    //             color: context.secondaryColor,
    //           ),
    //         );
    //       }else if( viewModel.sourceApi.status==AppStatus.error){
    //         return Center(
    //                     child: Text(
    //                       viewModel.sourceApi.errorMessage??"error!",
    //                       style: context.textTheme.bodyLarge,
    //                     ),
    //         );
    //       }else{
    //         return buildTabBarList(viewModel.sourceApi.data??[]);
    //       }

  }

  Widget buildTabBarList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(

            tabAlignment: .start,
            isScrollable: true,
            tabs: sources.map((source) {
              return Tab(text: source.name);
            }).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: sources
                  .map((source) => NewsListView(sourceId: source.id))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
