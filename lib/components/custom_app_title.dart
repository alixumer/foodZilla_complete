import 'package:flutter/material.dart';
import 'package:foodzilla/constants.dart';

class CustomAppTitle extends StatelessWidget {
  final String title;
  final Color color;

  const CustomAppTitle({Key? key, required this.title, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .copyWith(color: color, fontSize: 28.0, letterSpacing: 4.0, shadows: [
        BoxShadow(color: kTextColorDark, blurRadius: 9),
      ]),
    );
  }
}
