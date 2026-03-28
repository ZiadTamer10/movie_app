import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit(this.homeRepo) : super(PopularTvInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPopularTV() async {
    emit(PopularTvLoading());
    var result = await homeRepo.fetchPopulatTV();

    result.fold(
      (failure) => emit(PopularTvFailure(failure.errMessage)),
      (tv) => emit(PopularTvSuccess(tv)),
    );
  }
}
