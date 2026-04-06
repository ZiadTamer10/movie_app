import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:movie_app/features/authentication/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            GoRouter.of(context).push(AppRouter.kHomeView);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login Successfuly')));
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        child: LoginViewBody(),
      ),
    );
  }
}
