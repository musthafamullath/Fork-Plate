import 'package:flutter/material.dart';
import 'package:foodie_fly/utils/text_styles.dart';
import 'package:foodie_fly/view/screen/coupens/screen_coupens.dart';
import 'package:foodie_fly/view/widgets/class_widgets/button_widget.dart';

class ApplyCouponContainer extends StatelessWidget {
  const ApplyCouponContainer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .2,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Earn cashback on your order.',
            style: bigBoldBlack,
          ),
          const SizedBox(height: 12),
          ButtonWidget(
            width: width * 1.5,
            text: 'Apply Coupon',
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ScreenCoupons(),
                ),
              );
            }, height: width *2.5/10,
          )
        ],
      ),
    );
  }
}
