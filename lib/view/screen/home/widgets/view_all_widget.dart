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
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black87),
        ),
        InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[100]
              ),
              child: Text(
                buttonName,
                style: semiBoldWhite,
              ),
            )),
      ],
    );
  }
}
