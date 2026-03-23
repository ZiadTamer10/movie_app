import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/home/presentation/views/widgets/recommendation_list_view.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendation',
          style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        RecommendationListView(),
      ],
    );
  }
}
