import 'package:bookly/core/utils/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'You can also like',
          style: Styles.textStyle14,
        ),
        const SizedBox(
          height: 16,
        ),
        SimilarBooksListView(
          oldBookModel: bookModel,
        ),
      ],
    );
  }
}
