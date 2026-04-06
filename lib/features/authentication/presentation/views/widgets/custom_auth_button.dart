import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 234, 23, 8),
          ),
          child: Text(
            'Sign In',
            style: Styles.textStyle16.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
