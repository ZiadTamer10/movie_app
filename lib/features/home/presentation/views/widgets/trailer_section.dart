import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/model/movie_model.dart';
import 'package:movie_app/core/widgets/custom_error_widget.dart';
import 'package:movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/details_cubit/details_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerSection extends StatelessWidget {
  const TrailerSection(this.movieModel, {super.key});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          final trailers = state.details.videos.where(
            (video) => video.type == 'Trailer' && video.site == 'YouTube',
          );
          if (trailers.isNotEmpty) {
            final video = trailers.first;
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: video.key,
                  flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
                ),
                showVideoProgressIndicator: true,
              ),
            );
          } else {
            return Image.network(
              'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }
        } else if (state is DetailsFailure) {
          return CustomErrorWidget(state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
