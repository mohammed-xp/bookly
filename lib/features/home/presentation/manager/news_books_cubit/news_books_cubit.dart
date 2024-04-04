import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/model/book_model/book_model.dart';
part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this._homeRepo) : super(NewsBooksInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchNewsBooks() async {
    emit(NewsBooksLoading());

    var result = await _homeRepo.fetchNewsBooks();

    result.fold(
      (failure) {
        emit(NewsBooksFailure(failure.errMessage));
      },
      (books) {
        emit(NewsBooksSuccess(books));
      },
    );
  }
}
