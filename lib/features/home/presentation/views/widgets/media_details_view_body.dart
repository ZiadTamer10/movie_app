import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/views/widgets/custom_details_app_bar.dart';

class MediaDetailsViewBody extends StatelessWidget {
  const MediaDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomDetailsAppBar()]);
  }
}
