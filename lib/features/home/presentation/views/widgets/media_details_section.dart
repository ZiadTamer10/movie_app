import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_core_app_bar.dart';
import 'package:movie_app/core/model/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/widgets/movies_rating.dart';

class MediaDetailsSection extends StatelessWidget {
  const MediaDetailsSection(this.movieModel, {super.key});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCoreAppBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CachedNetworkImage(
            height: 200,
            width: double.infinity,
            imageUrl: 'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            movieModel.title ?? movieModel.name!,
            style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.calendar_month, color: Color(0xffBCBCBC)),
                  Text(
                    movieModel.releaseDate ?? movieModel.firstAirDate!,
                    style: Styles.textStyle16.copyWith(
                      color: Color(0XFFBCBCBC),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              MoviesRating(movieModel),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Overview',
            style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            movieModel.overview!,
            style: Styles.textStyle12.copyWith(
              color: Color(0xffBCBCBC),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
