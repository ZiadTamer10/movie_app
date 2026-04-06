import 'package:movie_app/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFailure extends Failures {
  const AuthFailure(super.errMessage);

  factory AuthFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return InvalidEmail(e.message ?? 'Invalid email address');
      case 'user-disabled':
        return UserDisabled(e.message ?? 'User account disabled');
      case 'user-not-found':
        return UserNotFound(e.message ?? 'User not found');
      case 'wrong-password':
        return WrongPassword(e.message ?? 'Wrong password');
      case 'email-already-in-use':
        return EmailAlreadyInUse(e.message ?? 'Email already in use');
      case 'operation-not-allowed':
        return OperationNotAllowed(e.message ?? 'Operation not allowed');
      case 'weak-password':
        return WeakPassword(e.message ?? 'Weak password');
      case 'too-many-requests':
        return TooManyRequests(e.message ?? 'Too many requests');
      default:
        return UnknownAuthFailure(
          e.message ?? 'Unexpected authentication error',
        );
    }
  }

  factory AuthFailure.fromException(Exception e) {
    if (e is FirebaseAuthException) {
      return AuthFailure.fromFirebaseAuthException(e);
    }
    return UnknownAuthFailure(e.toString());
  }
}

final class InvalidEmail extends AuthFailure {
  const InvalidEmail(super.errMessage);
}

final class UserDisabled extends AuthFailure {
  const UserDisabled(super.errMessage);
}

final class UserNotFound extends AuthFailure {
  const UserNotFound(super.errMessage);
}

final class WrongPassword extends AuthFailure {
  const WrongPassword(super.errMessage);
}

final class EmailAlreadyInUse extends AuthFailure {
  const EmailAlreadyInUse(super.errMessage);
}

final class OperationNotAllowed extends AuthFailure {
  const OperationNotAllowed(super.errMessage);
}

final class WeakPassword extends AuthFailure {
  const WeakPassword(super.errMessage);
}

final class TooManyRequests extends AuthFailure {
  const TooManyRequests(super.errMessage);
}

final class UnknownAuthFailure extends AuthFailure {
  const UnknownAuthFailure(super.errMessage);
}
