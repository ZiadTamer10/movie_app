import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/home/presentation/manager/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/popular_tv_cubit/popular_tv_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/top_rated_tv_cubit/top_rated_tv_cubit.dart';
import 'package:movie_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PopularMoviesCubit(getIt.get<HomeRepoImpl>())
                ..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (context) =>
              NowPlayingMoviesCubit(getIt.get<HomeRepoImpl>())
                ..fetchNowPlayingMovies(),
        ),
        BlocProvider(
          create: (context) =>
              TopRatedMoviesCubit(getIt.get<HomeRepoImpl>())
                ..fetchTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) =>
              PopularTvCubit(getIt.get<HomeRepoImpl>())..fetchPopularTV(),
        ),
        BlocProvider(
          create: (context) =>
              TopRatedTvCubit(getIt.get<HomeRepoImpl>())..fetchTopRatedTV(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
