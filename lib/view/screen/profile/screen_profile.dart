import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/profile/profile_bloc.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/view/screen/profile/widgets/dialog_box.dart';
import 'package:foodie_fly/view/widgets/class_widgets/app_bar_widget.dart';
import 'package:foodie_fly/view/widgets/class_widgets/button_widget.dart';
import 'package:foodie_fly/view/widgets/class_widgets/profile_span.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    context.read<ProfileBloc>().add(GetProfileEvent());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWidget(title: "Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: greenPointWithblue,
                      ),
                      width: size * 10 / 10,
                      child: Card(
                        shadowColor: greenPointWithblue,
                        surfaceTintColor: greenPointWithblue,
                        borderOnForeground: false,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: FadeInRightBig(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kHight20,
                                ProfileSpanText(
                                  indicateText: 'Seller Name:  ',
                                  valueText: state.profile?.firstName ?? 'first Name',
                                ),
                                kHight10,
                                const Divider(),
                                kHight10,
                                ProfileSpanText(
                                  indicateText: "Description:  ",
                                  valueText: state.profile?.lastName ??
                                      "last Name",
                                ),
                                kHight10,
                                const Divider(),
                                kHight10,
                                ProfileSpanText(
                                  indicateText: "Email:  ",
                                  valueText: state.profile?.email ?? "Email",
                                ),
                                kHight10,
                                const Divider(),
                                kHight10,
                                ProfileSpanText(
                                  indicateText: "Pin Code:  ",
                                  valueText:
                                      state.profile?.phone ?? "Phone",
                                ),
                                kHight10,
                                const Divider(),
                                kHight10,
                                ProfileSpanText(
                                  indicateText: "Seller Id:  ",
                                  valueText:
                                      "${state.profile?.userId ?? "user Id"}"
                                          .toString(),
                                ),
                                kHight10,
                                const Divider(),
                                kHight10,
                                ProfileSpanText(
                                  indicateText: "Seller Status:  ",
                                  valueText:
                                      state.profile?.status ?? "Seller Status",
                                ),
                                kHight10,
                                const Divider(),
                                kHight10,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    kHight30,
                    FadeInLeftBig(
                      child: ButtonWidget(
                        width: size * 7/ 10,
                        height: size * 2.7 / 10,
                        text: "LOG OUT",
                        onPressed: () async {
                          showDialogBox(context);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
