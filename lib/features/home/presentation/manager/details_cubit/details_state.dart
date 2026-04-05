part of 'details_cubit.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final DetailsModel details;

  const DetailsSuccess(this.details);
}

final class DetailsFailure extends DetailsState {
  final String errMessage;

  const DetailsFailure(this.errMessage);
}
