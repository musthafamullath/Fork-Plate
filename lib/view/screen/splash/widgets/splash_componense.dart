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
          children: [
            // kHight100,
            // kHight100,
            // // kHight100,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Sorry, ',
                    style: TextStyle(
                      fontSize: 50,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: ' I’m',
                        style: TextStyle(
                          backgroundColor: black,
                          decoration: TextDecoration.underline,
                          decorationColor: white,
                          decorationStyle: TextDecorationStyle.wavy,
                          fontSize: 70,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ]))
              ],
            ),
            Text.rich(
              TextSpan(
                text: ' P(late)',
                style: TextStyle(
                  fontSize: 30,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
