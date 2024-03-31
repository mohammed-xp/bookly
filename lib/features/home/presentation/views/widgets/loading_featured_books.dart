import 'package:flutter/material.dart';

import '../../../../../core/widgets/shimmer_loading_base.dart';

class LoadingFeaturedBooks extends StatelessWidget {
  const LoadingFeaturedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsetsDirectional.only(end: 16.0),
            child: AspectRatio(
              aspectRatio: 2.7 / 4,
              child: ShimmerLoadingBase(),
            ),
          );
        },
      ),
    );
  }
}
