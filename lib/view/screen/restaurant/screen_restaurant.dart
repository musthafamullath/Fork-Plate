import 'package:flutter/material.dart';
import 'package:foodie_fly/utils/text_styles.dart';

class ScreenRestaurant extends StatefulWidget {
  const ScreenRestaurant({super.key});

  @override
  State<ScreenRestaurant> createState() => _ScreenRestaurantState();
}

class _ScreenRestaurantState extends State<ScreenRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(20),
       color: Colors.yellow,
      child:const Center(child: Text("Restaurant page",style: boldWhite,),),
    );
  }
}