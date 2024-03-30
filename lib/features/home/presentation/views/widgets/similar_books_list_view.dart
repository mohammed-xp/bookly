import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsetsDirectional.only(end: 10.0),
            child: CustomBookImage(
              imageUrl: 'https://www.noor-book.com/publice/covers_cache_webp/16/9/f/e/90e75f97039fe1f6fbea714b63475bc7.jpg.webp',
            ),
          );
        },
      ),
    );
  }
}
