part of 'top_rated_tv_cubit.dart';

sealed class TopRatedTVState extends Equatable {
  const TopRatedTVState();

  @override
  List<Object> get props => [];
}

final class TopRatedTVInitial extends TopRatedTVState {}

final class TopRatedTVLoading extends TopRatedTVState {}

final class TopRatedTVSuccess extends TopRatedTVState {
  final List<MovieModel> tv;

  const TopRatedTVSuccess(this.tv);
}

final class TopRatedTVFailure extends TopRatedTVState {
  final String errMessage;

  const TopRatedTVFailure(this.errMessage);
}
