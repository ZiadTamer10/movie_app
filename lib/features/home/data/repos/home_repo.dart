import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failures, List<MovieModel>>> fetchTopRatedMovies();
  Future<Either<Failures, List<MovieModel>>> fetchNowPlayingMovies();
  Future<Either<Failures, List<MovieModel>>> fetchPopulatTV();
  Future<Either<Failures, List<MovieModel>>> fetchTopRatedTV();
  Future<Either<Failures, List<MovieModel>>> fetchSimilar({required int id});
}
