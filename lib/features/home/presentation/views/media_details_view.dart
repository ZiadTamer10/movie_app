import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';
import 'package:movie_app/features/home/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_details_view_body.dart';

class MediaDetailsView extends StatefulWidget {
  const MediaDetailsView(this.movieModel, {super.key});

  final MovieModel movieModel;

  @override
  State<MediaDetailsView> createState() => _MediaDetailsViewState();
}

class _MediaDetailsViewState extends State<MediaDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarCubit>(
      context,
    ).fetchSimilar(id: widget.movieModel.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: MediaDetailsViewBody()));
  }
}
