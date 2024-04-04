import 'package:flutter/material.dart';
import 'package:foodie_fly/utils/text_styles.dart';

class ViewAllwidget extends StatelessWidget {
  const ViewAllwidget({
    super.key,
    required this.text,
    required this.buttonName,
    required this.onTap,
  });
  final String text;
  final String buttonName;
  final Function()? onTap;
  
  get semiBoldOrange => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: boldBlack,
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              buttonName,
              style: semiBoldOrange,
            )),
      ],
    );
  }
}
