import 'package:flutter/material.dart';

import '../../../../../core/widgets/shimmer_loading_base.dart';

class LoadingFeaturedBooksListViewItem extends StatelessWidget {
  const LoadingFeaturedBooksListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(end: 16.0),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: ShimmerLoadingBase(),
      ),
    );
  }
}
