import 'package:flutter/material.dart';

import 'loading_featured_books_list_view_item.dart';

class LoadingFeaturedBooksListView extends StatelessWidget {
  const LoadingFeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const LoadingFeaturedBooksListViewItem();
        },
      ),
    );
  }
}
