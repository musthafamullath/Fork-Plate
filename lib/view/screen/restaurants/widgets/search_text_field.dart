import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/dish/dish_bloc.dart';
import 'package:foodie_fly/utils/constants.dart';

class SearchTextFieldForFood extends StatelessWidget {
  const SearchTextFieldForFood({
    super.key,
    required this.text,
    required this.sellerId,
  });
  final String text;
  final int sellerId;
  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.all(15),
      placeholder: text,
      backgroundColor: Colors.green[100],
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(
          CupertinoIcons.search,
          color: greenPointShade800,
          size: 32,
        ),
      ),
      suffixIcon:
          Icon(CupertinoIcons.xmark_circle_fill, color: greenPointShade800),
      style: TextStyle(color: greenPointShade800, fontSize: 20),
      onChanged: (value) async {
        context.read<DishBloc>().add(
              SearchDishEvent(
                query: value,
                sellerId: sellerId,
              ),
            );
      },
    );
  }
}
