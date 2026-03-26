import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      var data = await apiServices.get(endPoint: 'movie/popular');

      List<MovieModel> movies = [];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } on Exception catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchNowPlayingMovies() {
    // TODO: implement fetchPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies() {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }
}
