import 'package:flutter/material.dart';
import 'package:foodie_fly/utils/constants.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.name,
    required this.width,
    required this.height,
  });

  final String name;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              // style: DefaultTextStyle.of(cxt).style,
              children: <TextSpan>[
                const TextSpan(
                    text: 'Good evening\n',
                    style: TextStyle(
                      fontSize: 18,
                      color: black,
                    )),
                TextSpan(
                  text: name,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: greenPointShade800),
                ),
              ]),
        ),
        Container(
          alignment: Alignment.center,
          width: width * .125,
          height: height * .06,
          decoration: BoxDecoration(
            color:grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () async {
             
            },
            icon:  Icon(
              Icons.favorite,
              color: greenPointWithblue,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
