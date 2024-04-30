// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/cart/cart_bloc.dart';
import 'package:foodie_fly/controller/blocs/restaurant/restaurant_bloc.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/utils/text_styles.dart';
import 'package:foodie_fly/view/screen/cart/widgets/add_address_button.dart';
import 'package:foodie_fly/view/screen/cart/widgets/apply_coupen_container.dart';
import 'package:foodie_fly/view/screen/home/widgets/section_head.dart';
import 'package:foodie_fly/view/screen/main/screen_main_page.dart';
import 'package:foodie_fly/view/screen/restaurants/widgets/restaurant_dishes.dart';
import 'package:foodie_fly/view/widgets/class_widgets/app_bar_widget.dart';
import 'package:foodie_fly/view/widgets/class_widgets/item_row.dart';
import 'package:foodie_fly/view/widgets/function_widgets/snackbar.dart';
import 'package:input_quantity/input_quantity.dart';

class ScreenCart extends StatelessWidget {
  ScreenCart({super.key});

  final List<int> tips = [20, 30, 50];
  int selectedTip = 0;
  int total = 0;
  String couponCode = '';
  int sellerId = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<CartBloc>().add(GetAllCartItemsEvent());
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBarWidget(title: 'Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state is GetAllCartItemsState
              ? state.cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        "Your Cart is Empty",
                        style: bigBoldBlack,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SectionHead(heading: 'Added Items'),
                            Container(
                              padding: const EdgeInsets.all(18),
                              width: width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  BlocConsumer<CartBloc, CartState>(
                                    listener: (context, state) {
                                      if (state is AddToCartState) {
                                        showSnack(
                                            context, green, "Added To Cart");
                                      } else if (state
                                          is GetAllCartItemsFaildState) {
                                        showSnack(
                                            context, green, "Added To Faild");
                                      } else {}
                                    },
                                    builder: (context, state) {
                                      return state is GetAllCartItemsState &&
                                              state.cartItems.isEmpty
                                          ? const Center(
                                              child: Text('Cart is empty.'),
                                            )
                                          : ListView.separated(
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                sellerId = state
                                                        is GetAllCartItemsState
                                                    ? state.cartItems[index]
                                                        .sellerId
                                                    : 0;
                                                return SizedBox(
                                                  height: height * .075,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            state is GetAllCartItemsState
                                                                ? state
                                                                    .cartItems[
                                                                        index]
                                                                    .name
                                                                : 'Dish name',
                                                            style: boldBlack,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                          ),
                                                          state
                                                                  is GetAllCartItemsState
                                                              ? Text(
                                                                  '₹ ${state.cartItems[index].price * state.cartItems[index].quantity}',
                                                                  style:
                                                                      boldGreen,
                                                                )
                                                              : Text('Price',
                                                                  style:
                                                                      bigBoldGreen,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .clip)
                                                        ],
                                                      ),
                                                      const VerticalDivider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color: green
                                                                    .withOpacity(
                                                                        0.1),
                                                                borderRadius: const BorderRadius
                                                                    .horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            10),
                                                                    right: Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      3,
                                                                      3,
                                                                      3,
                                                                      3),
                                                              child: InputQty(
                                                                decoration: const QtyDecorationProps(
                                                                    width: 15,
                                                                    border:
                                                                        InputBorder
                                                                            .none),
                                                                initVal: state
                                                                        is GetAllCartItemsState
                                                                    ? state
                                                                        .cartItems[
                                                                            index]
                                                                        .quantity
                                                                    : 0,
                                                                onQtyChanged:
                                                                    (value) async {
                                                                  state is GetAllCartItemsState &&
                                                                          value >
                                                                              state
                                                                                  .cartItems[
                                                                                      index]
                                                                                  .quantity
                                                                      ? context.read<CartBloc>().add(AddToCartEvent(
                                                                          dishId: state
                                                                              .cartItems[
                                                                                  index]
                                                                              .dishId,
                                                                          context:
                                                                              context))
                                                                      : state is GetAllCartItemsState &&
                                                                              value < state.cartItems[index].quantity
                                                                          ? context.read<CartBloc>().add(DecreaseCartEvent(dishId: state.cartItems[index].dishId, context: context))
                                                                          : null;
                                                                },
                                                                qtyFormProps:
                                                                    const QtyFormProps(
                                                                        enableTyping:
                                                                            false),
                                                              ),
                                                            ),
                                                          ),
                                                          const VerticalDivider(),
                                                          IconButton(
                                                              onPressed:
                                                                  () async {
                                                                state is GetAllCartItemsState
                                                                    ? context.read<CartBloc>().add(DeleteItemFromCartEvent(
                                                                        dishId: state
                                                                            .cartItems[
                                                                                index]
                                                                            .dishId,
                                                                        context:
                                                                            context))
                                                                    : null;
                                                              },
                                                              icon:
                                                                  CircleAvatar(
                                                                radius: 18,
                                                                backgroundColor:
                                                                    black.withOpacity(
                                                                        0.05),
                                                                foregroundColor:
                                                                    red,
                                                                child:
                                                                    const Icon(
                                                                  Icons.delete,
                                                                  size: 25,
                                                                ),
                                                              ))
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return divider1g;
                                              },
                                              itemCount:
                                                  state is GetAllCartItemsState
                                                      ? state.cartItems.length
                                                      : 0,
                                            );
                                    },
                                  ),
                                  kHight10,
                                  divider2,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SectionHead(
                                          heading: 'Add more items'),
                                      BlocBuilder<RestaurantBloc,
                                          RestaurantState>(
                                        builder: (context, state) {
                                          return IconButton(
                                              onPressed: () {
                                                if (sellerId != 0) {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ScreenRestaurantDishes(
                                                        seller: state
                                                            .restaurants
                                                            .firstWhere(
                                                                (element) =>
                                                                    element
                                                                        .id ==
                                                                    sellerId),
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ScreenMainPage(),
                                                    ),
                                                  );
                                                }
                                              },
                                              icon: const Icon(
                                                CupertinoIcons.add_circled,
                                                size: 42,
                                              ));
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            kHight20,
                            const SectionHead(heading: 'Apply Coupon'),
                            kHight10,
                            ApplyCouponContainer(width: width, height: height),
                            kHight20,
                            const SectionHead(heading: 'Bill Details'),
                            kHight10,
                            Container(
                              width: width,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state) {
                                      return ItemRow(
                                        keyString: 'Item Total : ',
                                        value: state is GetAllCartItemsState
                                            ? '₹ ${state.total}'
                                            : '₹ 0',
                                        width: 5,
                                        thickness: width * 1 / 200,
                                        color: grey,
                                      );
                                    },
                                  ),
                                  kHight10,
                                  divider1,
                                  ItemRow(
                                    keyString: 'Delivery fee :',
                                    value: 'free',
                                    width: 5,
                                    thickness: width * 1 / 200,
                                    color: grey,
                                  ),
                                  kHight10,
                                  divider1,
                                  BlocBuilder<CartBloc, CartState>(
                                    buildWhen: (previous, current) =>
                                        current is! CartInitial,
                                    builder: (context, state) {
                                      if (state is GetAllCartItemsState) {
                                        return ItemRow(
                                          width: 5,
                                          thickness: width * 1 / 200,
                                          color: grey,
                                          keyString: 'Discount :',
                                          value: '₹ ${state.discount}',
                                        );
                                      }
                                      return ItemRow(
                                        width: 5,
                                        thickness: width * 1 / 200,
                                        color: grey,
                                        keyString: 'Discount :',
                                        value: '₹ 0',
                                      );
                                    },
                                  ),
                                  kHight10,
                                  divider1,
                                  kHight10,
                                  BlocBuilder<CartBloc, CartState>(
                                    buildWhen: (previous, current) =>
                                        current is! CartInitial,
                                    builder: (context, state) {
                                      state is GetAllCartItemsState
                                          ? couponCode = state.couponCode
                                          : '';
                                      return ItemRow(
                                        width: 5,
                                        thickness: width * 1 / 200,
                                        color: grey,
                                        keyString: 'Total Amount : ',
                                        value: state is GetAllCartItemsState
                                            ? '₹ ${state.total - state.discount}'
                                            : state is GetAllCartItemsState
                                                ? '₹ ${state.total}'
                                                : '₹ 0',
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            kHight20,
                            const SectionHead(heading: 'Add Or Select Address'),
                            kHight10,
                            Container(
                              width: width,
                              height: height * .25,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: 32,
                                        backgroundColor:
                                            black.withOpacity(0.09),
                                        foregroundColor: red,
                                        child: const Icon(
                                          Icons.location_on,
                                          size: 30,
                                        ),
                                      ),
                                      const SectionHead(
                                          heading:
                                              'Where would you like \n us to deliver\n this order?')
                                    ],
                                  ),
                                  kHight30,
                                  AddAddressButton(
                                    width: width,
                                    couponCode: couponCode,
                                    height: height,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
              : kHight10;
        },
      ),
    );
  }
}
