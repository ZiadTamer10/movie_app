import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.homeRepo) : super(SimilarInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilar() async {
    emit(SimilarLoading());
    var result = await homeRepo.fetchSimilar(id: 500);
    result.fold(
      (failure) => SimilarFailure(failure.errMessage),
      (similar) => SimilarSuccess(similar),
    );
  }
}
