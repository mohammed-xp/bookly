import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccess){
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
                    imageUrl:
                    'https://www.noor-book.com/publice/covers_cache_webp/16/9/f/e/90e75f97039fe1f6fbea714b63475bc7.jpg.webp',
                  ),
                );
              },
            ),
          );
        } else if(state is SimilarBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        } else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
