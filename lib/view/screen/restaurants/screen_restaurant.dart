import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/restaurant/restaurant_bloc.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/utils/text_styles.dart';
import 'package:foodie_fly/view/screen/home/widgets/section_head.dart';
import 'package:foodie_fly/view/screen/restaurants/widgets/restaurant_dishes.dart';
import 'package:foodie_fly/view/widgets/class_widgets/app_bar_widget.dart';
import 'package:foodie_fly/view/widgets/class_widgets/search_text_field.dart';

class ScreenRestaurants extends StatelessWidget {
  const ScreenRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RestaurantBloc>().add(RestaurantEvent());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBarWidget(title: "Restaurants"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<RestaurantBloc, RestaurantState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SearchTextField(text: "Search restaurants..."),
                  kHight20,
                  state.restaurants.isEmpty
                      ? const Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Text(
                                "Please wait",
                                style: semiBoldBlack,
                              ),
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SectionHead(heading: "All Restaurants"),
                            kHight10,
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.restaurants.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ScreenRestaurantDishes(
                                          seller: state.restaurants[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    height: height * .2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            width: 5,
                                            color: Colors.green.shade200),
                                        color: Colors.green[100],
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            blurStyle: BlurStyle.outer,
                                            color: green,
                                          )
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Row(
                                        children: <Widget>[
                                          kWidth10,
                                          Container(
                                            decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.green.withOpacity(0.1)),
                                                      shape: BoxShape.circle,),
                                            child: CircleAvatar(
                                              radius: 60,
                                              backgroundColor: Colors.green[50],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(7.5),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 5,
                                                              color:
                                                                  Colors.grey.withOpacity(0.3)),
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Container(
                                                          margin: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 12,
                                                              vertical: 12),
                                                          height: height * .112,
                                                          width: width * .225,
                                                          decoration:const BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                'assets/icons/restaurant.png',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: green.withOpacity(0.9)),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            Colors.green.withOpacity(0.7),
                                                        child: Text(
                                                          state.restaurants[index]
                                                              .name
                                                              .substring(0, 1)
                                                              .toUpperCase(),
                                                          style:const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 27.5,
                                                              color: white),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          kWidth10,
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                state.restaurants[index].name,
                                                style: bigBoldWhite,
                                              ),
                                              Text(
                                                state.restaurants[index]
                                                    .description,
                                                style: semiBoldGrey,
                                              ),
                                            ],
                                          ),
                                          kWidth10,
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
