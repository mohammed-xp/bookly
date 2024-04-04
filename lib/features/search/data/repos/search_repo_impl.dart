import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/model/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo{

  SearchRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({required String query})async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=$query',
      );

      List<BookModel> books = [];
      if(data['totalItems'] == 0){
        return right(books);
      } else {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}