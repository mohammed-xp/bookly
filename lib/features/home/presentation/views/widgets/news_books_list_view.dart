import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/news_books_cubit/news_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loading_news_books_list_view.dart';
import 'news_books_list_view_item.dart';

class NewsBooksListView extends StatelessWidget {
  const NewsBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBooksCubit, NewsBooksState>(
      builder: (context, state) {

        if (state is NewsBooksSuccess) {
          return  ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: NewsBooksListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewsBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage, onPressed: () {
            BlocProvider.of<NewsBooksCubit>(context).fetchNewsBooks();
          },);
        } else {
          return const LoadingNewsBooksListView();
        }
      },
    );
  }
}
