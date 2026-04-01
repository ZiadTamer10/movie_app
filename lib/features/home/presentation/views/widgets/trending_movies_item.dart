import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/model/movie_model.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies(this.poster, this.movieModel, {super.key});

  final String poster;
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(
        context,
      ).push(AppRouter.kMediaDetailsView, extra: movieModel),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: CachedNetworkImage(
            imageUrl: poster,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[300],
              child: Center(
                child: Icon(
                  Icons.broken_image,
                  size: 40,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
