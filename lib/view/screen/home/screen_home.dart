import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/offer/offer_bloc.dart';
import 'package:foodie_fly/controller/blocs/profile/profile_bloc.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/utils/text_styles.dart';
import 'package:foodie_fly/view/screen/home/widgets/categories.dart';
import 'package:foodie_fly/view/screen/home/widgets/header.dart';
import 'package:foodie_fly/view/screen/home/widgets/screen_all_categories.dart';
import 'package:foodie_fly/view/screen/home/widgets/screen_dishes.dart';
import 'package:foodie_fly/view/screen/home/widgets/section_head.dart';
import 'package:foodie_fly/view/screen/home/widgets/view_all_widget.dart';
import 'package:foodie_fly/view/screen/offer_details/screen_offer.dart';
import 'package:foodie_fly/view/widgets/class_widgets/search_text_field.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<OfferBloc>().add(GetAllOfferEvent());
    context.read<ProfileBloc>().add(GetProfileEvent());

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Header(width: width, height: height)),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHight20,
                    const SearchTextField(text: 'Search restaurants...'),
                    kHight20,
                    ViewAllwidget(
                      text: "Categories",
                      buttonName: "View All",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ScreenAllCategories(),
                        ));
                      },
                    ),
                    kHight10,
                    CategoriesGridview(height: height, width: width),
                    kHight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SectionHead(heading: 'Offers'),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green[100]),
                              child: const Text(
                                'View All',
                                style: semiBoldWhite,
                              ),
                            ))
                      ],
                    ),
                    BlocBuilder<OfferBloc, OfferState>(
                      builder: (context, state) {
                        return state.offers.isEmpty
                            ? const Center(
                                child: Text("No offers available"),
                              )
                            : ScreenOffer(
                                height: height,
                                width: width,
                                offers: state.offers,
                              );
                      },
                    ),
                    kHight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SectionHead(heading: 'Dishes'),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green[100]),
                              child: const Text(
                                'View All',
                                style: semiBoldWhite,
                              ),
                            ))
                      ],
                    ),
                    kHight20,
                    BlocBuilder<OfferBloc, OfferState>(
                      builder: (context, state) {
                        return state.offers.isEmpty
                            ? const Center(
                                child: Text("No Dishes available"),
                              )
                            : ScreenDishes(
                                height: height,
                                width: width,
                                offer: state.offers,
                              );
                      },
                    ),
                    kHight30,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
