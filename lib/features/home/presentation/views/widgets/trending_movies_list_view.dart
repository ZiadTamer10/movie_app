import 'package:carousel_slider/carousel_slider.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets_data.dart';
import 'package:movie_app/features/home/presentation/views/widgets/trending_movies_item.dart';

//? Normal List View Builder
class TrendingMoviesListView extends StatelessWidget {
  const TrendingMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TrendingMovies(),
          );
        },
      ),
    );
  }
}

//? Carousel Slider work with animation
class TrendingMoviesCarouselSlider extends StatelessWidget {
  const TrendingMoviesCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) {
          return TrendingMovies();
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
  }
}

//? Fan Carousel Slider its animation like a fan
class FanCarouselSlider extends StatelessWidget {
  const FanCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // لو عايز نفس الصورة تتكرر 5 مرات
    final List<String> repeatedImages = List.filled(100, AssetsData.testImage);

    return FanCarouselImageSlider.sliderType1(
      imagesLink: repeatedImages,
      isAssets: true,
      sliderHeight: 270,
      slideViewportFraction: 0.6, // للتحكم في المسافة بين الصور
      autoPlay: false,
      showIndicator: true,
    );
  }
}
