import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/models/source.dart';
import 'package:news/ui/utils/extensions/context_extension.dart';
import 'news_list.dart';

class NewsTab extends StatelessWidget {
  const NewsTab(this.categoryName, {super.key});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.loadNewsSource(categoryName),
      builder: (context, snapshots) {
        if (snapshots.hasError) {
          return Center(
            child: Text(
              snapshots.error.toString(),
              style: context.textTheme.labelLarge,
            ),
          );
        } else if (snapshots.hasData) {
          if (snapshots.data!.isEmpty) {
            return Center(
              child: Text(
                "No news found",
                style: context.textTheme.displayMedium,
              ),
            );
          }
          return buildTabBarList(snapshots.data!);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
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
