import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/model/book_model/book_model.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/news_books_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Content(),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          return Expanded(
            child: Center(
              child: Text(
                'Find the book you want 🔍',
                style: Styles.textStyle18.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          );
        } else if (state is SearchBooksSuccess) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Search Result',
                  style: Styles.textStyle18,
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                    child: SearchResultListView(
                  books: state.books,
                )),
              ],
            ),
          );
        } else if (state is SearchBooksEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                'There are no results for your search',
                style: Styles.textStyle18.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          );
        } else if (state is SearchBooksFailure) {
          // TODO: build onPressed here correctly
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onPressed: null,
          );
        } else {
          return const Expanded(child: Center(child: CustomLoadingIndicator()));
        }
      },
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),

          /// Change here
          child: NewsBooksListViewItem(
            bookModel: books[index],
          ),
        );
      },
    );
  }
}
