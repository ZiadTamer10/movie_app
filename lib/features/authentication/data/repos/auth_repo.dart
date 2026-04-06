import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failures, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failures, User>> register({
    required String email,
    required String password,
  });
}
