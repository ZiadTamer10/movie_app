import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_error_widget.dart';
import 'package:movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/trending_movies_item.dart';

// //? Normal List View Builder
// class TrendingMoviesListView extends StatelessWidget {
//   const TrendingMoviesListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * .35,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: TrendingMovies(),
//           );
//         },
//       ),
//     );
//   }
// }

//? Carousel Slider work with animation
class TrendingMoviesCarouselSlider extends StatelessWidget {
  const TrendingMoviesCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: CarouselSlider.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index, realIndex) {
                return TrendingMovies(
                  'https://image.tmdb.org/t/p/w500${state.movies[index].posterPath}',
                  state.movies[index],
                );
              },
              options: CarouselOptions(
                height: 270,
                enlargeCenterPage: true,
                viewportFraction: 0.5,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
            ),
          );
        } else if (state is PopularMoviesFailure) {
          return CustomErrorWidget(state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}

// //? Fan Carousel Slider its animation like a fan
// class FanCarouselSlider extends StatelessWidget {
//   const FanCarouselSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // لو عايز نفس الصورة تتكرر 5 مرات
//     final List<String> repeatedImages = List.filled(100, AssetsData.testImage);

//     return FanCarouselImageSlider.sliderType1(
//       imagesLink: repeatedImages,
//       isAssets: true,
//       sliderHeight: 270,
//       slideViewportFraction: 0.6, // للتحكم في المسافة بين الصور
//       autoPlay: false,
//       showIndicator: true,
//     );
//   }
// }
