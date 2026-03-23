import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/views/widgets/media_item_card.dart';

class PopularTvListView extends StatelessWidget {
  const PopularTvListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: MediaItemCard(),
          );
        },
      ),
    );
  }
}
