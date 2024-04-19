part of 'cart_bloc.dart';

class CartEvent {}

class GetAllCartItemsEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int dishId;
 
  AddToCartEvent({required this.dishId, required BuildContext context,});
}

class DecreaseCartEvent extends CartEvent {
  final int dishId;
  
  DecreaseCartEvent({required this.dishId, });
}

class DeleteItemFromCartEvent extends CartEvent {
  final int dishId;
 
  DeleteItemFromCartEvent({required this.dishId,});
}

class AddTipEvent extends CartEvent {
  final int tip;
  AddTipEvent({required this.tip});
}

class GetAllCouponsEvent extends CartEvent {}

class GetAvailableCouponsEvent extends CartEvent {}

class RedeemCouponEvent extends CartEvent {
  final Coupon coupon;
  RedeemCouponEvent({required this.coupon});
}

class CheckoutEvent extends CartEvent {
  final CheckOut checkOut;

  CheckoutEvent({required this.checkOut,});
}
