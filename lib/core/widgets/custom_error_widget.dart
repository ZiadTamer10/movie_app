import 'package:flutter/widgets.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.errMessage, {super.key});

  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage, style: Styles.textStyle16));
  }
}
