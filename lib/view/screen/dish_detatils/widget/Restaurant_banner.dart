import 'package:flutter/material.dart';
import 'package:foodie_fly/model/seller.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/view/screen/home/widgets/section_head.dart';

class RestaurantBanner extends StatelessWidget {
  const RestaurantBanner({super.key, required this.seller});

  final Seller seller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 31,
          backgroundColor: Colors.green,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/icons/restaurant.png',
              height: 36,
            ),
          ),
        ),
        kWidth10,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHead(heading: seller.name),
            Text(seller.description)
          ],
        ),
      ],
    );
  }
}
