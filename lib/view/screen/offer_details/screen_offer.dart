import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/restaurant/restaurant_bloc.dart';
import 'package:foodie_fly/model/offer.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/utils/text_styles.dart';

class ScreenOffer extends StatelessWidget {
  const ScreenOffer({
    super.key,
    required this.height,
    required this.width,
    required this.offers,
  });
  final double height;
  final double width;
  final List<Offer> offers;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < offers.length; i++) {
      context
          .read<RestaurantBloc>()
          .add(GetRestaurantByEvent(sellerId: offers[i].sellerId));
    }
    return SizedBox(
      height: height * .32,
      width: width * .9,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: offers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.only(right: 12, top: 8),
              width: width - (width * .4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Container(
                    height: height * .175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: .5),
                      image: DecorationImage(
                        image: NetworkImage(offers[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  kHight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      kHight10,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                            const  Text('Item: ',style: semiBoldBlack,),
                          Text(
                            offers[index].offerTitle,
                            style: boldBlack,
                          )
                            ],
                          ),
                          
                          BlocBuilder<RestaurantBloc, RestaurantState>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                 const Text('Seller: ',style: semiBoldBlack,),
                                  Text(
                                    state.seller?.name ?? 'Ajwa',
                                    style: semiBoldGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                          // Row(

                          //   children: <Widget>[
                              
                          //     const Text('start with: ',style: semiBoldBlack,),
                          //     Text(
                          //       DateFormat.yMMMMd('en_US').format(
                          //           DateTime.parse(offers[index].startDate)),
                          //       style: semiBoldGreen,
                          //     ),
                          //   ],
                          // ),
                          Row(

                            children: <Widget>[
                              
                              const Text('ends with: ',style: semiBoldBlack,),
                              Text(
                                DateFormat.yMMMMd('en_US').format(
                                    DateTime.parse(offers[index].endDate)),
                                style: semiBoldGreen,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: black,
                        child: CircleAvatar(
                          
                          radius: 22,
                          backgroundColor: green,
                          foregroundColor: white,
                          child: Text(
                              '${offers[index].offerPercentage.toString()}%'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
