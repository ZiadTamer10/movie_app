import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/widgets/movies_rating.dart';

class MediaItemCard extends StatelessWidget {
  const MediaItemCard(this.movieModel, {super.key});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kMediaDetailsView);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
                height: MediaQuery.of(context).size.height * .27,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                movieModel.title ?? movieModel.name!,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle16,
              ),
            ),
            MoviesRating(movieModel),
          ],
        ),
      ),
    );
  }
}
