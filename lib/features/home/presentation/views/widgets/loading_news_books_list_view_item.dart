import 'package:flutter/material.dart';

import '../../../../../core/widgets/shimmer_loading_base.dart';

class LoadingNewsBooksListViewItem extends StatelessWidget {
  const LoadingNewsBooksListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            const AspectRatio(
              aspectRatio: 2.7 / 4,
              child: ShimmerLoadingBase(),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  ShimmerLoadingBase(
                    height: 16,
                    width: MediaQuery.of(context).size.width * .5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ShimmerLoadingBase(
                    height: 16,
                    width: MediaQuery.of(context).size.width * .5,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const ShimmerLoadingBase(
                    height: 14,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      ShimmerLoadingBase(
                        height: 16,
                        width:120,
                      ),
                      Spacer(),
                      ShimmerLoadingBase(
                        height: 14,
                        width: 60,
                      ),
                      // BookRating(
                      //   rating: bookModel.volumeInfo.averageRating?.toDouble() ?? 0,
                      //   count: bookModel.volumeInfo.ratingsCount ?? 0,
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
