part of 'popular_tv_cubit.dart';

sealed class PopularTVState extends Equatable {
  const PopularTVState();

  @override
  List<Object> get props => [];
}

final class PopularTVInitial extends PopularTVState {}

final class PopularTVLoading extends PopularTVState {}

final class PopularTVSuccess extends PopularTVState {
  final List<MovieModel> tv;

  const PopularTVSuccess(this.tv);
}

final class PopularTVFailure extends PopularTVState {
  final String errMessage;

  const PopularTVFailure(this.errMessage);
}
