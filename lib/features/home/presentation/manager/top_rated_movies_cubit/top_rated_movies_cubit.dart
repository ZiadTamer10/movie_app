import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.homeRepo) : super(TopRatedMoviesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    var result = await homeRepo.fetchTopRatedMovies();
    result.fold(
      (failure) {
        emit(TopRatedMoviesFailure(failure.errMessage));
      },
      (movies) {
        emit(TopRatedMoviesSuccess(movies));
      },
    );
  }
}
