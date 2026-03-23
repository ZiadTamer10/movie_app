import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/home/presentation/views/media_details_view.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const kHomeView = '/homeView';
  static const kMediaDetailsView = '/mediaDetailsView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: kMediaDetailsView,
        builder: (context, state) => MediaDetailsView(),
      ),
    ],
  );
}
