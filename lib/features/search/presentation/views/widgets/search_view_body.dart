import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_core_app_bar.dart';
import 'package:movie_app/features/search/presentation/views/widgets/custom_button.dart';
import 'package:movie_app/features/search/presentation/views/widgets/custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  bool isMovieSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCoreAppBar(),
        CustomSearchTextField(),
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
              },
            ),
          ],
        ),
      ],
    );
  }
}
