import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_details_section.dart';
import 'package:movie_app/features/home/presentation/views/widgets/similar_section.dart';

class MediaDetailsViewBody extends StatelessWidget {
  const MediaDetailsViewBody(this.movieModel, {super.key});

  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: MediaDetailsSection(movieModel)),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: SimilarSection()),
      ],
    );
  }
}
