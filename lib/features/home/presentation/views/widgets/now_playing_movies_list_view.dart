import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/views/widgets/now_playing_movies_item.dart';

class NowPlayingMoviesListView extends StatelessWidget {
  const NowPlayingMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: NowPlayingMoviesItem(),
          );
        },
      ),
    );
  }
}
