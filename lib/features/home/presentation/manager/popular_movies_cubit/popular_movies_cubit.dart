import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepo) : super(PopularMoviesInitial());

  final HomeRepo homeRepo;
  Future<void> fetchPopularMovies() async {
    emit(PopularMoviesLoading());
    var result = await homeRepo.fetchPopularMovies();
    result.fold(
      (failure) => emit(PopularMoviesFailure(failure.errMessage)),
      (movies) => emit(PopularMoviesSuccess(movies)),
    );
  }
}
