import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.homeRepo) : super(SimilarInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilar({required int id, required String type}) async {
    emit(SimilarLoading());
    var result = await homeRepo.fetchSimilarData(id: id, type: type);

    result.fold(
      (failure) {
        emit(SimilarFailure(failure.errMessage));
      },
      (search) {
        if (search.isEmpty) {
          emit(SimilarEmpty(type));
        } else {
          emit(SimilarSuccess(search));
        }
      },
    );
  }
}
