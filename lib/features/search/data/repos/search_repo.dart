import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/model/movie_model.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<MovieModel>>> fetchSearch({
    required String type,
    required String query,
  });
}
