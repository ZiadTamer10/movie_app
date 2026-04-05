import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/model/details_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.homeRepo) : super(DetailsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchDetails({required int id, required String type}) async {
    emit(DetailsLoading());
    var result = await homeRepo.fetchDetails(id: id, type: type);

    result.fold(
      (failure) => emit(DetailsFailure(failure.errMessage)),
      (vedio) => emit(DetailsSuccess(vedio)),
    );
  }
}
