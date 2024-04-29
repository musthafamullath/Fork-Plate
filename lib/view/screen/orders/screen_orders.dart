import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/controller/blocs/order/order_bloc.dart';
import 'package:foodie_fly/model/order.dart';
import 'package:foodie_fly/utils/constants.dart';
import 'package:foodie_fly/view/screen/orders/widgets/all_orders.dart';

class ScreenOrders extends StatelessWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderBloc>().add(GetAllOrdersEvent());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title:const Padding(
            padding:  EdgeInsets.only(bottom:10.0),
            child:  Text(
              'Orders',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: white),
            ),
          ),
          bottom: TabBar(
            labelColor: black,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            unselectedLabelColor: green,
            indicatorWeight: 20.9,
            indicatorColor: white,
            dividerColor: black,
            indicatorPadding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              color: greenPointShade800,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                color: Colors.green,
                width: 7,
              ),
            ),
            tabs: [
              Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: white,
                  ),
                  child: const Tab(
                    text: "Delivered",
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: white,
                  ),
                  child: const Tab(
                    text: 'All Orders',
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: white,
                  ),
                  child: const Tab(
                    text: "Pending",
                  )),
              // Tab(text: ),
              // Tab(text: ),
            ],
          ),
        ),
        body: TabBarView(children: [
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return AllOrders(
                order: state.orders,
              );
            },
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              List<Order> orders = state.orders
                  .where((e) => e.orderStatus.toLowerCase() == 'delivered')
                  .toList();
              return AllOrders(
                order: orders,
              );
            },
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              List<Order> orders = state.orders
                  .where((e) =>
                      e.orderStatus.toLowerCase() == 'ordered' ||
                      e.orderStatus.toLowerCase() == 'pending' ||
                      e.orderStatus.toLowerCase() == 'food ready')
                  .toList();
              return AllOrders(
                order: orders,
              );
            },
          ),
        ]),
      ),
    );
  }
}
