import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_item_card.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
        itemCount: 10,
        itemBuilder: (context, index) {
          return MediaItemCard();
        },
      ),
    );
  }
}
