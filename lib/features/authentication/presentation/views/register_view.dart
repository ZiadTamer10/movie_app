import 'package:flutter/material.dart';
import 'package:movie_app/features/authentication/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterViewBody());
  }
}
