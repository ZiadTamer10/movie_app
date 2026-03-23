import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_details_view_body.dart';

class MediaDetailsView extends StatelessWidget {
  const MediaDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: MediaDetailsViewBody()));
  }
}
