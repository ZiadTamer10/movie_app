import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
