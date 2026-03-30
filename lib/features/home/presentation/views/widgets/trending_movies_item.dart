import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies(this.poster, {super.key});

  final String poster;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: CachedNetworkImage(
          imageUrl: poster,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
