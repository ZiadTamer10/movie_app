import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/features/authentication/data/repos/auth_repo.dart';

part 'auth_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await authRepo.login(email: email, password: password);

    result.fold(
      (failure) => emit(LoginFailure(failure.errMessage)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
