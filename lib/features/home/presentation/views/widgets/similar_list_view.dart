import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_error_widget.dart';
import 'package:movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_item_card.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(
      builder: (context, state) {
        if (state is SimilarSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: ListView.builder(
              itemCount: state.similar.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: MediaItemCard(state.similar[index]),
                );
              },
            ),
          );
        } else if (state is SimilarFailure) {
          return CustomErrorWidget(state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
