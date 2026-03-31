import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:movie_app/features/home/presentation/views/widgets/home_section.dart';
import 'package:movie_app/features/home/presentation/views/widgets/now_playing_list_view.dart';
import 'package:movie_app/features/home/presentation/views/widgets/popular_tv_list_view.dart';
import 'package:movie_app/features/home/presentation/views/widgets/top_rated_movies_list_view.dart';
import 'package:movie_app/features/home/presentation/views/widgets/top_rated_tv_list_view.dart';
import 'package:movie_app/features/home/presentation/views/widgets/trending_movies_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Trendings 🔥', style: Styles.textStyle24),
              ),
              TrendingMoviesCarouselSlider(),
              SizedBox(height: 10),
            ],
          ),
        ),
        HomeSection(title: 'Now Playing', child: NowPlayingListView()),
        HomeSection(title: 'Top Rated Movies', child: TopRatedMoviesListView()),
        HomeSection(title: 'Popoular TV', child: PopularTvListView()),
        HomeSection(title: 'Top Rated TV', child: TopRatedTvListView()),
      ],
    );
  }
}
