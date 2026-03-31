part of 'similar_cubit.dart';

sealed class SimilarState extends Equatable {
  const SimilarState();

  @override
  List<Object> get props => [];
}

final class SimilarInitial extends SimilarState {}

final class SimilarLoading extends SimilarState {}

final class SimilarSuccess extends SimilarState {
  final List<MovieModel> similar;

  const SimilarSuccess(this.similar);
}

final class SimilarFailure extends SimilarState {
  final String errMessage;

  const SimilarFailure(this.errMessage);
}
