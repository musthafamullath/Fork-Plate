import 'package:flutter/material.dart';
import 'package:foodie_fly/utils/constants.dart';

class SplashComponeses extends StatelessWidget {
  const SplashComponeses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'FOODIE ',
                    style: TextStyle(
                      fontSize: 50,
                      color: black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'FLY',
                    style: TextStyle(
                      fontSize: 50,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
