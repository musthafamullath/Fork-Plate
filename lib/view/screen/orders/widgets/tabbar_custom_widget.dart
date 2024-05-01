
import 'package:flutter/material.dart';
import 'package:foodie_fly/utils/text_styles.dart';
import 'package:foodie_fly/view/screen/orders/widgets/tabbar_text_widget.dart';


class TabBarWidgetCustom extends StatelessWidget {
  const TabBarWidgetCustom({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green,
          border: BorderDirectional(
            bottom: BorderSide(
              color: Colors.green.shade800,
              width: 10,
            ),
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      child: AppBar(
        backgroundColor: Colors.green,
        title: const Padding(
          padding:  EdgeInsets.only(top: 10),
          child:  Text('Orders', style: bigBoldWhite),
        ),
        centerTitle: true,
        bottom: const TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorWeight: 5,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TabBarWidget(
                text: 'All Orders',
              ),
            ),
            TabBarWidget(
              text: 'Delivered',
            ),
           
            TabBarWidget(
              text: 'Pending',
            ),
          ],
        ),
      ),
    );
  }
}
