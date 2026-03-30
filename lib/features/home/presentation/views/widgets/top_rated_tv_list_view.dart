import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_error_widget.dart';
import 'package:movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/top_rated_tv_cubit/top_rated_tv_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_item_card.dart';

class TopRatedTvListView extends StatelessWidget {
  const TopRatedTvListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedTvCubit, TopRatedTVState>(
      builder: (context, state) {
        if (state is TopRatedTVSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: ListView.builder(
              itemCount: state.tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: MediaItemCard(state.tv[index]),
                );
              },
            ),
          );
        } else if (state is TopRatedTVFailure) {
          return CustomErrorWidget(state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
