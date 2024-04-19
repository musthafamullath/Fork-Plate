import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/cart/cart_bloc.dart';
import 'package:foodie_fly/model/dish.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/utils/text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.width,
    required this.height,
    required this.dish,
  });

  final double width;
  final double height;
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width - 125,
          height: height * .075,
          child: ElevatedButton.icon(
            onPressed: () async {
              context
                  .read<CartBloc>()
                  .add(AddToCartEvent(dishId: dish.dishId, context: context));
            },
            icon: const Icon(Icons.shopping_bag_outlined,size: 40,color: white,),
            label: const Text('Add to bag',style: bigBoldWhite,),
            style: ElevatedButton.styleFrom(
              backgroundColor: green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
