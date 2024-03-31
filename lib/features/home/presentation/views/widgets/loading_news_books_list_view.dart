import 'package:flutter/material.dart';

import 'loading_news_books_list_view_item.dart';

class LoadingNewsBooksListView extends StatelessWidget {
  const LoadingNewsBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const LoadingNewsBooksListViewItem();
      },
    );
  }
}
