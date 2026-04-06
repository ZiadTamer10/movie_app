import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/features/authentication/data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    var result = await authRepo.register(email: email, password: password);
    result.fold(
      (failure) => emit(RegisterFailure(failure.errMessage)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}
