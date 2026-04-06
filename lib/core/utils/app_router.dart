import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/model/movie_model.dart';
import 'package:movie_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:movie_app/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:movie_app/features/authentication/presentation/views/login_view.dart';
import 'package:movie_app/features/authentication/presentation/views/register_view.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/home/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/home/presentation/views/media_details_view.dart';
import 'package:movie_app/features/search/data/repos/search_repo_impl.dart';
import 'package:movie_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kMediaDetailsView = '/mediaDetailsView';
  static const kSearchView = '/searchView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
          child: LoginView(),
        ),
      ),
      GoRoute(path: kRegisterView, builder: (context, state) => RegisterView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: kMediaDetailsView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SimilarCubit(getIt.get<HomeRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => DetailsCubit(getIt.get<HomeRepoImpl>()),
            ),
          ],
          child: MediaDetailsView(state.extra as MovieModel),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
          child: SearchView(),
        ),
      ),
    ],
  );
}
