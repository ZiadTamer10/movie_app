import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';

class MoviesRating extends StatelessWidget {
  const MoviesRating(
    this.movieModel, {
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 110),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        spacing: 4,
        children: [
          FaIcon(
            FontAwesomeIcons.solidStar,
            size: 14,
            color: Color(0xffffdd4f),
          ),
          Text((((movieModel.voteAverage ?? 0) * 10).floor() / 10).toString()),
        ],
      ),
    );
  }
}
