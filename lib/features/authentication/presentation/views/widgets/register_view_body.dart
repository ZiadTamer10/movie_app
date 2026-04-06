import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/authentication/presentation/manager/register_cubit/register_cubit.dart';
import 'package:movie_app/features/authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:movie_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200),
            Text(
              'Sign Up',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            CustomTextFormField(
              hintText: 'Email',
              onChanged: (value) {
                email = value;
              },
            ),
            CustomTextFormField(
              obscureText: true,
              hintText: 'Password',
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 50),
            CustomAuthButton(
              text: 'Sign Up',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<RegisterCubit>().register(
                    email: email!.trim(),
                    password: password!.trim(),
                  );
                }
              },
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Text("Do you have account?", style: Styles.textStyle16),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                  child: Text(
                    'Sign In',
                    style: Styles.textStyle16.copyWith(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
