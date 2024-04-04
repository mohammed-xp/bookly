import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/model/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._homeRepo) : super(SimilarBooksInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    var result = await _homeRepo.fetchSimilarBooks(category: category);

    result.fold(
          (failure) {
        emit(SimilarBooksFailure(failure.errMessage));
      },
          (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
