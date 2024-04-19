import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/restaurant/restaurant_bloc.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/utils/text_styles.dart';
import 'package:foodie_fly/view/screen/home/widgets/section_head.dart';
import 'package:foodie_fly/view/screen/restaurant/widgets/restaurant_dishes.dart';
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
        preferredSize: Size.fromHeight(70),
        child: AppBarWidget(title: "Restaurants"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                            FadeInUpBig(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(),
                                          color: Colors.green[50]),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25),
                                        child: Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 60,
                                              backgroundColor: Colors.grey[200],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12,
                                                      vertical: 12),
                                                  height: height * .112,
                                                  width: width * .225,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/icons/restaurant.png',
                                                      ),
                                                    ),
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
                                                  style: bigBoldBlack,
                                                ),
                                                Text(
                                                  state.restaurants[index]
                                                      .description,
                                                  style: semiBoldGrey,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
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
