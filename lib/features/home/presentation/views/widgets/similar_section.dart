import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/home/presentation/views/widgets/similar_list_view.dart';

class SimilarSection extends StatelessWidget {
  const SimilarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Similar',
            style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 10),
        SimilarListView(),
      ],
    );
  }
}
