import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:movie_app/features/home/presentation/views/widgets/trending_movies_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Trendings 🔥', style: Styles.textStyle24),
        ),
        SizedBox(height: 10),
        TrendingMoviesListView(),
      ],
    );
  }
}
