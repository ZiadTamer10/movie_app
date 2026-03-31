import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_error_widget.dart';
import 'package:movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/popular_tv_cubit/popular_tv_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_item_card.dart';

class PopularTvListView extends StatelessWidget {
  const PopularTvListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTvCubit, PopularTVState>(
      builder: (context, state) {
        if (state is PopularTVSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
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
        } else if (state is PopularTVFailure) {
          return CustomErrorWidget(state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
