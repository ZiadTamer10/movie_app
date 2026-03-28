import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTVState> {
  PopularTvCubit(this.homeRepo) : super(PopularTvInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPopularTV() async {
    emit(PopularTVLoading());
    var result = await homeRepo.fetchPopulatTV();

    result.fold(
      (failure) => emit(PopularTVFailure(failure.errMessage)),
      (tv) => emit(PopularTVSuccess(tv)),
    );
  }
}
