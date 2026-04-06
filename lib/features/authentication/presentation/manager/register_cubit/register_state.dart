part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final User user;

  const RegisterSuccess(this.user);
}

final class RegisterFailure extends RegisterState {
  final String errMessage;

  const RegisterFailure(this.errMessage);
}
