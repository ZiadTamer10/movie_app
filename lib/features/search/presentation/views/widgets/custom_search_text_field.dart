import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: TextField(
        decoration: InputDecoration(
          hint: buildHintText(),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Opacity(
              opacity: 0.8,
              child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22),
            ),
          ),
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
      child: Text('Search', style: TextStyle(fontSize: 18)),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(borderSide: BorderSide(color: Color(0xff202020)));
  }
}
