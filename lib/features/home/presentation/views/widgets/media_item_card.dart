import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/assets_data.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/home/presentation/views/widgets/movies_rating.dart';

class MediaItemCard extends StatelessWidget {
  const MediaItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kMediaDetailsView);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .27,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(AssetsData.testImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '8 Mile',
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle16,
              ),
            ),
            MoviesRating(),
          ],
        ),
      ),
    );
  }
}
