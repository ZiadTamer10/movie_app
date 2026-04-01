import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_error_widget.dart';
import 'package:movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_item_card.dart';
import 'package:movie_app/features/search/presentation/manager/search_cubit/search_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: (screenWidth / 3.1) / 200,
              ),
              itemCount: state.movieModel.length,
              itemBuilder: (context, index) {
                return MediaItemCard(state.movieModel[index]);
              },
            ),
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(state.errMessage);
        } else if (state is SearchLoading) {
          return CustomLoadingIndicator();
        } else {
          return SizedBox();
        }
      },
    );
  }
}
