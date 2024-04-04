import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fly/utils/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: greenPointShade800,
          border: BorderDirectional(
            bottom: BorderSide(
              color: greenPointShade800,
              width: 10,
            ),
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: FadeInDownBig(
            child: Text(title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 26,
                  color: white,
                )),
          ),
        ),
      ),
    );
  }
}
