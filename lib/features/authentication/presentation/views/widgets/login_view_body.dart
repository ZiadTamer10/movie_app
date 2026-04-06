import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:movie_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
              'Sign In',
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
              text: 'Sign In',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                }
              },
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Text("Don't you have account?", style: Styles.textStyle16),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kRegisterView);
                  },
                  child: Text(
                    'Sign Up',
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
