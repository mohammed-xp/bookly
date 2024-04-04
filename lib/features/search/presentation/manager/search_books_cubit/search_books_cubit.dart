import 'package:bloc/bloc.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/model/book_model/book_model.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this._searchRepo) : super(SearchBooksInitial());

  final SearchRepo _searchRepo;

  Future<void> searchBooks({required String query}) async {
    emit(SearchBooksLoading());

    var result = await _searchRepo.searchBooks(
      query: query,
    );

    result.fold(
      (failure) {
        emit(SearchBooksFailure(failure.errMessage));
      },
      (books) {
        if (books.isEmpty){
          emit(SearchBooksEmpty());
        } else {
        emit(SearchBooksSuccess(books));
        }
      },
    );
  }
}
