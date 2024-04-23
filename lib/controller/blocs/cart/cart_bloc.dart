import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie_fly/controller/api_sevices/cart/api_calling.dart';
import 'package:foodie_fly/controller/api_sevices/checkout/api_calling.dart';
import 'package:foodie_fly/controller/api_sevices/coupon/api_calling.dart';
import 'package:foodie_fly/model/cart_item.dart';
import 'package:foodie_fly/model/checkout.dart';
import 'package:foodie_fly/model/coupon.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int discount = 0;
  CartBloc() : super(CartInitial()) {
    on<GetAllCartItemsEvent>(getAllCartItemsEvent);
    on<AddToCartEvent>(addToCartEvent);
    on<DecreaseCartEvent>(decreaseCartEvent);
    on<DeleteItemFromCartEvent>(deleteItemFromCartEvent);
    on<GetAllCouponsEvent>(getAllCouponsEvent);
    on<GetAvailableCouponsEvent>(getAvailableCouponsEvent);
    on<RedeemCouponEvent>(redeemCouponEvent);
    on<CheckoutEvent>(checkoutEvent);
  }

  FutureOr<void> getAllCartItemsEvent(
      GetAllCartItemsEvent event, Emitter<CartState> emit) async {
    List<CartItem> cartItems = await CartApiService().getAllCartItems();
    final total = sum(cartItems);
    emit(
      GetAllCartItemsState(
        cartItems: cartItems,
        total: total,
        discount: discount,
        couponCode: '',
      ),
    );
  }

  FutureOr<void> addToCartEvent(
      AddToCartEvent event, Emitter<CartState> emit) async {
    final value = await CartApiService().addToCart(event.dishId);
    final cartItems = await CartApiService().getAllCartItems();
    final total = sum(cartItems);
    if (value) {
      emit(
        GetAllCartItemsState(
          cartItems: cartItems,
          total: total,
          discount: discount,
          couponCode: '',
        ),
      );
      emit(AddToCartState());
    } else {
      emit(GetAllCartItemsFaildState());
    }
  }

  FutureOr<void> decreaseCartEvent(
      DecreaseCartEvent event, Emitter<CartState> emit) async {
    final value = await CartApiService().decreaseFromCart(event.dishId);
    final cartItems = await CartApiService().getAllCartItems();
    final total = sum(cartItems);
    if (value) {
      emit(
        GetAllCartItemsState(
          cartItems: cartItems,
          total: total,
          discount: discount,
          couponCode: '',
        ),
      );
    } else {
      emit(GetAllCartItemsFaildState());
    }
  }

  FutureOr<void> deleteItemFromCartEvent(
      DeleteItemFromCartEvent event, Emitter<CartState> emit) async {
    final value = await CartApiService().deleteItemFromCart(event.dishId);
    final cartItems = await CartApiService().getAllCartItems();
    final total = sum(cartItems);
    if (value) {
      emit(
        GetAllCartItemsState(
          cartItems: cartItems,
          total: total,
          discount: discount,
          couponCode: '',
        ),
      );
    } else {
      emit(GetAllCartItemsFaildState());
    }
  }

  FutureOr<void> getAllCouponsEvent(
      GetAllCouponsEvent event, Emitter<CartState> emit) async {
    final coupons = await CouponApiServices().getAllCoupons();
    final cartItems = await CartApiService().getAllCartItems();
    final total = sum(cartItems);
    emit(
      GetAllCouponsState(coupons: coupons),
    );
    emit(
      GetAllCartItemsState(
        cartItems: cartItems,
        total: total,
        discount: discount,
        couponCode: '',
      ),
    );
  }

  FutureOr<void> getAvailableCouponsEvent(
      GetAvailableCouponsEvent event, Emitter<CartState> emit) async {
    final coupons = await CouponApiServices().getAvailableCoupons();
    final cartItems = await CartApiService().getAllCartItems();
    final total = sum(cartItems);
    emit(
      GetAllCouponsState(coupons: coupons),
    );
    emit(
      GetAllCartItemsState(
        cartItems: cartItems,
        total: total,
        discount: discount,
        couponCode: '',
      ),
    );
  }

  FutureOr<void> redeemCouponEvent(
      RedeemCouponEvent event, Emitter<CartState> emit) async {
    final coupons = await CouponApiServices().getAvailableCoupons();
    final cartItems = await CartApiService().getAllCartItems();
    final total = sum(cartItems);
    if (event.coupon.minimumAmtRequired < total) {
      discount = event.coupon.discount;
      emit(
        GetAllCouponsState(coupons: coupons),
      );
      emit(
        GetAllCartItemsState(
          cartItems: cartItems,
          total: total,
          discount: discount,
          couponCode: event.coupon.couponCode,
        ),
      );
    }
  }

  FutureOr<void> checkoutEvent(
      CheckoutEvent event, Emitter<CartState> emit) async {
    final value = await CheckOutApiServices().checkOut(event.checkOut);
    if (value == null) {
      emit(CheckOutSuccessState());
    } else {
      emit(CheckOutFaildState());
    }
  }

  int sum(List<CartItem> cartItems) {
    int total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total += cartItems[i].price.round() * cartItems[i].quantity;
    }
    return total;
  }
}
