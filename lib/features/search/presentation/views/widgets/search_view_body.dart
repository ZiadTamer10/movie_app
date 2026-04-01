import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_core_app_bar.dart';
import 'package:movie_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movie_app/features/search/presentation/views/widgets/custom_button.dart';
import 'package:movie_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:movie_app/features/search/presentation/views/widgets/search_result_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  bool isMovieSelected = true;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCoreAppBar(),
          CustomSearchTextField(controller, isMovie: isMovieSelected),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Movie',
                backgroundColor: isMovieSelected
                    ? Color.fromARGB(255, 234, 23, 8)
                    : Color(0xff20242A),
                onPressed: () {
                  setState(() {
                    isMovieSelected = true;
                  });
                  if (controller.text.isNotEmpty) {
                    BlocProvider.of<SearchCubit>(
                      context,
                    ).fetchSearch(type: 'movie', query: controller.text);
                  }
                },
              ),
              SizedBox(width: 12),
              CustomButton(
                text: 'TV',
                backgroundColor: isMovieSelected
                    ? Color(0xff20242A)
                    : Color.fromARGB(255, 234, 23, 8),
                onPressed: () {
                  setState(() {
                    isMovieSelected = false;
                  });
                  if (controller.text.isNotEmpty) {
                    BlocProvider.of<SearchCubit>(
                      context,
                    ).fetchSearch(type: 'tv', query: controller.text);
                  }
                },
              ),
            ],
          ),
          SearchResultListView(),
        ],
      ),
    );
  }
}
