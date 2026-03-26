part of 'now_playing_movies_cubit.dart';

sealed class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

final class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

final class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

final class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
  final List<MovieModel> movies;

  const NowPlayingMoviesSuccess(this.movies);
}

final class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String errMessage;

  const NowPlayingMoviesFailure(this.errMessage);
}
