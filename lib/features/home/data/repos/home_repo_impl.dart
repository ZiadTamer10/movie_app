import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/model/details_model.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/core/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  Future<Either<Failures, List<MovieModel>>> fetchData({
    required String endPoint,
  }) async {
    try {
      var data = await apiServices.get(endPoint: endPoint);

      final List<MovieModel> result = [];
      for (var item in data['results']) {
        result.add(MovieModel.fromJson(item));
      }
      return right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.factoryDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<MovieModel>>> fetchPopularMovies() =>
      fetchData(endPoint: 'movie/popular');

  @override
  Future<Either<Failures, List<MovieModel>>> fetchNowPlayingMovies() =>
      fetchData(endPoint: 'movie/now_playing');

  @override
  Future<Either<Failures, List<MovieModel>>> fetchTopRatedMovies() =>
      fetchData(endPoint: 'movie/top_rated');

  @override
  Future<Either<Failures, List<MovieModel>>> fetchPopulatTV() =>
      fetchData(endPoint: 'tv/popular');

  @override
  Future<Either<Failures, List<MovieModel>>> fetchTopRatedTV() =>
      fetchData(endPoint: 'tv/top_rated');

  @override
  Future<Either<Failures, DetailsModel>> fetchDetails({
    required int id,
    required String type,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint: '$type/$id',
        queryParameters: {'append_to_response': 'videos'},
      );

      return right(DetailsModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.factoryDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<MovieModel>>> fetchSimilarData({
    required int id,
    required String type,
  }) => fetchData(endPoint: '$type/$id/similar');
}
