import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies(this.poster, {super.key});

  final String poster;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(image: NetworkImage(poster), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
