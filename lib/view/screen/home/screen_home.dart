import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/profile/profile_bloc.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/view/screen/home/widgets/categories.dart';
import 'package:foodie_fly/view/screen/home/widgets/header.dart';
import 'package:foodie_fly/view/screen/home/widgets/section_head.dart';
import 'package:foodie_fly/view/screen/home/widgets/screen_all_categories.dart';
import 'package:foodie_fly/view/screen/home/widgets/view_all_widget.dart';
import 'package:foodie_fly/view/widgets/class_widgets/search_text_field.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    context.read<ProfileBloc>().add(GetProfileEvent());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHight20,
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return HeaderSection(
                        name: state.profile?.firstName ?? 'Name',
                        width: width,
                        height: height);
                  },
                ),
                kHight20,
                SearchTextField(text: 'Search restaurants...'),
                kHight20,
                ViewAllwidget(
                  text: "Categories",
                  buttonName: "View All",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenAllCategories(),));
                  },
                ),
                CategoriesGridview(height: height, width: width),
                kHight10,
                const Divider(thickness: 2),
                kHight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHead(heading: 'Offers'),
                    TextButton(onPressed: () {}, child: const Text('View all'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
