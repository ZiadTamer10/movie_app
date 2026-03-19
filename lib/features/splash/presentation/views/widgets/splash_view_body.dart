import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets_data.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AssetsData.splashImage),
        ),
      ),
    );
  }
}
