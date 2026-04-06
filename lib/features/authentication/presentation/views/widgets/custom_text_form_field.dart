import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(this.hintText, {super.key});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: TextField(
        onSubmitted: (value) {},
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
