import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16),child: Text(title, style: Styles.textStyle24),),           
            SizedBox(height: 10),
            child,
            SizedBox(height: 10),
          ],
        ),
      
    );
  }
}
