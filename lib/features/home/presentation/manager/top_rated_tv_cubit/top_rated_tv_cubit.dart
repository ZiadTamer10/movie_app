import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'top_rated_tv_state.dart';

class TopRatedTvCubit extends Cubit<TopRatedTVState> {
  TopRatedTvCubit(this.homeRepo) : super(TopRatedTVInitial());
  final HomeRepo homeRepo;

  Future<void> fetchTopRatedTV() async {
    emit(TopRatedTVLoading());
    var result = await homeRepo.fetchTopRatedTV();

    result.fold(
      (failure) => emit(TopRatedTVFailure(failure.errMessage)),
      (tv) => emit(TopRatedTVSuccess(tv)),
    );
  }
}
