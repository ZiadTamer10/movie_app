import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_core_app_bar.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
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
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
                ),
                fit: BoxFit.fill,
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
