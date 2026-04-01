import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/model/movie_model.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearch({
    required String type,
    required String query,
  }) async {
    emit(SearchLoading());

    var result = await searchRepo.fetchSearch(type: type, query: query);

    result.fold(
      (failure) => emit(SearchFailure(failure.errMessage)),
      (search) => emit(SearchSuccess(search)),
    );
  }
}
