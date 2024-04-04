import 'package:flutter/material.dart';
import 'package:foodie_fly/model/dish.dart';
import 'package:foodie_fly/model/seller.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/view/screen/dish_detatils/widget/Restaurant_banner.dart';
import 'package:foodie_fly/view/screen/dish_detatils/widget/image_container.dart';
import 'package:foodie_fly/view/screen/home/widgets/section_head.dart';
import 'package:foodie_fly/view/widgets/class_widgets/app_bar_widget.dart';

class ScreenDishDetails extends StatelessWidget {
  ScreenDishDetails({super.key, required this.dish, required this.seller});
  final Dish dish;
  final Seller seller;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: dish.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(width: width, height: height, dish: dish),
                kHight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionHead(heading: dish.name),
                    SectionHead(heading: '₹ ${dish.price}')
                  ],
                ),
                kHight20,
                RestaurantBanner(seller: seller),
                kHight20,
                Text(dish.description),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
