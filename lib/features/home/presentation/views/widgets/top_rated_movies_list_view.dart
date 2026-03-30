import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_error_widget.dart';
import 'package:movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_item_card.dart';

class TopRatedMoviesListView extends StatelessWidget {
  const TopRatedMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: ListView.builder(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: MediaItemCard(state.movies[index]),
                );
              },
            ),
          );
        } else if (state is TopRatedMoviesFailure) {
          return CustomErrorWidget(state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
