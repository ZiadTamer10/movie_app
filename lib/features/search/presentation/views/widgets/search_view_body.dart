import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_core_app_bar.dart';
import 'package:movie_app/features/search/presentation/views/widgets/custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [CustomCoreAppBar(), CustomSearchTextField()],
    );
  }
}
