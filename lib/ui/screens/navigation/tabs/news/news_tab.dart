import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/models/source.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';
import 'news_list.dart';

class NewsTab extends StatefulWidget {
  const NewsTab(this.categoryName, {super.key});
  final String categoryName;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsViewModel viewModel;
  // NewsViewModel newsViewModel= NewsViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.categoryName);
    });
    // newsViewModel.loadSources(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //     stream: newsViewModel.controller.stream,
    //     builder: (context, snapshot){
    //       if(snapshot.data == null){ // this app
    //         return Center(child: CircularProgressIndicator());
    //       }else {
    //         return buildTabBarList(snapshot.data!);
    //       }
    //     });
    return ChangeNotifierProvider(
      create: (context) => NewsViewModel(),
      child: Builder(
        builder: (context) {
          viewModel = Provider.of(context);
          return viewModel.sources.isEmpty
              ? Center(child: Text("No sources available!",style: context.textTheme.displayMedium,))
              : buildTabBarList(viewModel.sources);
        },
      ),
    );
   // return FutureBuilder(
   //    future: ApiManager.loadNewsSource(widget.categoryName),
   //    builder: (context, snapshots) {
   //      if (snapshots.hasError) {
   //        return Center(
   //          child: Text(
   //            snapshots.error.toString(),
   //            style: context.textTheme.labelLarge,
   //          ),
   //        );
   //      } else if (snapshots.hasData) {
   //        if (snapshots.data!.isEmpty) {
   //          return Center(
   //            child: Text(
   //              "No news found",
   //              style: context.textTheme.displayMedium,
   //            ),
   //          );
   //        }
   //        return buildTabBarList(snapshots.data!);
   //      } else {
   //        return Center(child: CircularProgressIndicator());
   //      }
   //    },
   //  );
  }

  Widget buildTabBarList(List<Source> sources) {
    // Source.currentNewsId = sources[0].id;
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              Source.currentNewsId = sources[index].id;
            },
            tabAlignment: .start,
            isScrollable: true,
            tabs: sources.map((source) {
              return Tab(text: source.name);
            }).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: sources
                  .map((source) => NewsListView(sourceId: source.id!))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsViewModel extends ChangeNotifier {
  List<Source> sources = [];
  // StreamController<List<Source>?> controller = StreamController();

  Future<void> loadSources(String categoryName) async {
    sources = await ApiManager.loadNewsSource(categoryName);
    notifyListeners();
    // var sources = await ApiManager.loadNewsSource(categoryName);
    // controller.add(sources);
  }
}
