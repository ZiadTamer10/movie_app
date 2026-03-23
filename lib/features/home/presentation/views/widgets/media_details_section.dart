import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets_data.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:movie_app/features/home/presentation/views/widgets/movies_rating.dart';

class MediaDetailsSection extends StatelessWidget {
  const MediaDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDetailsAppBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsData.testImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '8 Mile',
            style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.calendar_month, color: Color(0xffBCBCBC)),
                  Text(
                    '2002-11-08',
                    style: Styles.textStyle16.copyWith(
                      color: Color(0XFFBCBCBC),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              MoviesRating(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Overview',
            style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'For Jimmy Smith Jr., life is a daily fight just to keep hope alive. Feeding his dreams in Detroit’s vibrant music scene, Jimmy wages an extraordinary personal struggle to find his own voice—and earn a place in a world where rhymes rule, legends are born, and every moment… is another chance.',
            style: Styles.textStyle12.copyWith(
              color: Color(0xffBCBCBC),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
