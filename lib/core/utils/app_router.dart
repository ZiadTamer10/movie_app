import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/home/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/home/presentation/views/media_details_view.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const kHomeView = '/homeView';
  static const kMediaDetailsView = '/mediaDetailsView';
  static const kSearchView = '/searchView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: kMediaDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarCubit(getIt.get<HomeRepoImpl>()),
          child: MediaDetailsView(state.extra as MovieModel),
        ),
      ),
      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),
    ],
  );
}
