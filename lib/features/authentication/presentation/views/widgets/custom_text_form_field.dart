import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
  });

  final String hintText;
  final Function(String) onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field is required';
          }

          if (hintText == 'Email' && !value.contains('@')) {
            return 'Enter valid email';
          }

          if (hintText == 'Password' && value.length < 6) {
            return 'Password must be at least 6 characters';
          }

          return null;
        },
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hint: buildHintText(),
          fillColor: Color(0xff202020),
          filled: true,
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  Opacity buildHintText() {
    return Opacity(
      opacity: 0.8,
      child: Text(hintText, style: TextStyle(fontSize: 18)),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(borderSide: BorderSide(color: Color(0xff202020)));
  }
}
