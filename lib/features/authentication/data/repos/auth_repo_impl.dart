import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/errors/auth_failure.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/auth_services.dart';
import 'package:movie_app/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthServices authServices;

  AuthRepoImpl(this.authServices);

  @override
  Future<Either<Failures, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      var user = await authServices.login(email: email, password: password);
      if (user == null) {
        return left(UnknownAuthFailure('Authentication failed'));
      }
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failures, User>> register({
    required String email,
    required String password,
  }) async {
    try {
      var user = await authServices.register(email: email, password: password);
      if (user == null) return left(UnknownAuthFailure('Registration failed'));
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(AuthFailure.fromException(e));
    }
  }
}
