import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:movie_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        Text(
          'Sign In',
          style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 15),
        CustomTextFormField('Email'),
        CustomTextFormField('Password'),
        SizedBox(height: 50),
        CustomAuthButton(),
      ],
    );
  }
}
