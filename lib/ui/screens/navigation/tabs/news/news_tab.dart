import 'package:flutter/material.dart';

import 'news_card.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: 3,
          child: TabBar(
              tabs: [
            Text("tab1"),
            Text("tab2"),
            Text("tab3"),
          ]),
        ),
        Expanded(child: buildNewListView())
      ],
    );
  }

 Widget buildNewListView() {
    return ListView.builder(
      itemCount: 15,
        itemBuilder: (_,index){
      return NewsCard();
    });
 }
}
