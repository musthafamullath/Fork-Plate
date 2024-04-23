// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fly/controller/api_sevices/address/api_calling.dart';
import 'package:foodie_fly/model/address.dart';
import 'package:foodie_fly/model/order.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/utils/text_styles.dart';
import 'package:foodie_fly/view/screen/order_details/screen_order_details.dart';
import 'package:foodie_fly/view/widgets/class_widgets/item_row.dart';
import 'package:intl/intl.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key, required this.order});
  final List<Order> order;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView.builder(
        itemCount: order.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              final address = await AddressApiServices()
                  .getAddressById(order[index].addressId);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ScreenOrderDetails(
                    order: order[index],
                    address: address ??
                        Address(
                          addressId: 0,
                          userId: 0,
                          district: 'district',
                          houseName: 'houseName',
                          name: 'name',
                          phone: 'phone',
                          pinCode: 'pinCode',
                          street: 'street', 
                          state: 'state',
                        ),
                  ),
                ),
              );
            },
            child: Container(
              width: width,
              // height: height * .25,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  kHight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: width * .14,
                        height: height * .08,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/icons/check-mark.png',
                          color: Colors.green[900],
                        ),
                      ),
                      kWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Order Id:  '),
                              Text(
                                order[index].orderId.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: boldGreen,
                              ),
                              Text(
                                '   ${order[index].itemCount} items',
                                style: boldBlack,
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text('Order on: '),
                              Text(
                                DateFormat(" d MMM yyyy").format(
                                  DateTime.parse(order[index].orderDate),
                                ),
                                style: semiBoldBlack,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  kHight10,
                  ItemRow(
                      keyString: 'Price',
                      value:
                          '₹ ${order[index].totalPrice - order[index].deliveryCharge}'),
                  divider1,
                  ItemRow(
                      keyString: 'Order status',
                      value: order[index].orderStatus)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
