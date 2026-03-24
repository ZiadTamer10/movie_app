import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_details_section.dart';
import 'package:movie_app/features/home/presentation/views/widgets/similar_section.dart';

class MediaDetailsViewBody extends StatelessWidget {
  const MediaDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: MediaDetailsSection()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: SimilarSection()),
      ],
    );
  }
}
