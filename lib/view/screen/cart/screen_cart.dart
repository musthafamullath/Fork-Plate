import 'package:flutter/material.dart';
import 'package:foodie_fly/utils/text_styles.dart';

class ScreenCart extends StatefulWidget {
  const ScreenCart({super.key});

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(20),
      color: Colors.black,
      child:const Center(child: Text("Cart page",style: boldWhite,),),
    );
  }
}