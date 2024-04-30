import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/restaurant/restaurant_bloc.dart';
import 'package:foodie_fly/model/offer.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/utils/text_styles.dart';

class ScreenDishes extends StatelessWidget {
  const ScreenDishes({
    super.key,
    required this.height,
    required this.width,
    required this.offer,
  });
  final double height;
  final double width;
  final List<Offer> offer;
  @override
  Widget build(BuildContext context) {
    final reversedOfferList = offer.reversed.toList();
    for (int i = 0; i < reversedOfferList.length; i++) {
      context
          .read<RestaurantBloc>()
          .add(GetRestaurantByEvent(sellerId: reversedOfferList[i].sellerId));
    }
    return AspectRatio(
      aspectRatio: 0.9,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: reversedOfferList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            log(reversedOfferList.length.toString());
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white,
                border: Border.all(width: 3, color: grey.withOpacity(0.5)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: height * .13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(width: 1, color: grey.withOpacity(0.5)),
                      image: DecorationImage(
                        image: NetworkImage(reversedOfferList[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          reversedOfferList[index].offerTitle,
                          style: boldGrey,
                        ),
                        BlocBuilder<RestaurantBloc, RestaurantState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                Text(
                                  state.seller?.name ?? 'Ajwa',
                                  style: boldGrey,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        ),
      ),
    );
  }
}
