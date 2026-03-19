import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoviesRating extends StatelessWidget {
  const MoviesRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 115),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        spacing: 4,
        children: [
          FaIcon(
            FontAwesomeIcons.solidStar,
            size: 14,
            color: Color(0xffffdd4f),
          ),
          Text('7.3'),
        ],
      ),
    );
  }
}
