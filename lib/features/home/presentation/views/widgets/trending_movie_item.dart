import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets_data.dart';

class TrendingMovie extends StatelessWidget {
  const TrendingMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 270,
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(
            image: AssetImage(AssetsData.testImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
