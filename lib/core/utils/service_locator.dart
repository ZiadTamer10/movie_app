import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/core/utils/auth_services.dart';
import 'package:movie_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/search/data/repos/search_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiServices>()),
  );

  getIt.registerSingleton<AuthServices>(AuthServices());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt.get<AuthServices>()),
  );
}
