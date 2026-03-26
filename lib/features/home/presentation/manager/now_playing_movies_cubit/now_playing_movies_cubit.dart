import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(this.homeRepo) : super(NowPlayingMoviesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());

    var result = await homeRepo.fetchNowPlayingMovies();
    result.fold(
      (failure) => emit(NowPlayingMoviesFailure(failure.errMessage)),
      (movies) => emit(NowPlayingMoviesSuccess(movies)),
    );
  }
}
