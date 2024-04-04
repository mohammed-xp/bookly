import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{

  Future<Either<Failure, List<BookModel>>> searchBooks({
    required String query,
});
}