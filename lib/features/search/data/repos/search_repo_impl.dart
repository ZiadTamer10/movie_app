import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/model/movie_model.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<Failures, List<MovieModel>>> fetchSearch({
    required String type,
    required String query,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint: 'search/$type',
        queryParameters: {'query': query},
      );

      List<MovieModel> search = [];
      for (var item in data['results']) {
        search.add(MovieModel.fromJson(item));
      }
      return right(search);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.factoryDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
