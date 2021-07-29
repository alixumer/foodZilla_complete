import 'package:flutter/material.dart';
import 'package:foodzilla/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.title,required this.onTap}) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // max width
        height: 55.0,
        child: Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: kTextColorWhite, fontSize: 18.0),
            )),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kDefaultPadding),
              bottomRight: Radius.circular(kDefaultPadding),
            )),
      ),
    );
  }
}
