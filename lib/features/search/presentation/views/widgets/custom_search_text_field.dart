import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/features/search/presentation/manager/search_cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField(
    this.controller, {
    super.key,
    required this.isMovie,
  });

  final bool isMovie;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: TextField(
        controller: controller,
        onSubmitted: (value) {
          BlocProvider.of<SearchCubit>(
            context,
          ).fetchSearch(type: isMovie ? 'movie' : 'tv', query: value);
        },
        decoration: InputDecoration(
          hint: buildHintText(),
          suffixIcon: IconButton(
            onPressed: () {
              final query = controller.text;

              if (query.isNotEmpty) {
                context.read<SearchCubit>().fetchSearch(
                  type: isMovie ? 'movie' : 'tv',
                  query: query,
                );
              }
            },
            icon: Opacity(
              opacity: 0.8,
              child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22),
            ),
          ),
          fillColor: Color(0xff202020),
          filled: true,
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  Opacity buildHintText() {
    return Opacity(
      opacity: 0.8,
      child: Text('Search', style: TextStyle(fontSize: 18)),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(borderSide: BorderSide(color: Color(0xff202020)));
  }
}
