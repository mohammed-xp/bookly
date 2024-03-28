import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 15,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: BookListViewItem(),
        );
      },
    );
  }
}
