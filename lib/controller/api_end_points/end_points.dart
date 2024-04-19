class ApiEndPoints {
  static const String baseUrl = 'http://10.0.2.2:8989';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String verifyOtp = '/verifyOtp';
  static const String getUserProfile = '/profile';
  static const String updateUserProfile = '/profile/edit';
  static const String getDishesByCategory = '/dishes?l=10&category=';
  static const String getDishesBySeller = '/dishes?seller=';
  static const String searchSeller = '/search/sellers?q=';
  static const String getSellerById = '/user/sellers/';
  static const String getAllOffers = '/offers';
  static const String userSeller = '/user/sellers';
  static const String addToCart = '/addToCart/';
  static const String decreaseformcart = '/cart/';
  static const String decreaseformdecrement = '/decrement';
  static const String deleteItemFromCart = '/deleteItem';
  static const String getAllCartItems = '/cart';
  static const String getAllCoupons = '/coupons';
  static const String getAvailableCoupons = '/coupons/available';
  static const String checkOut = '/cart/checkout';
  static const String verifyPayment = '/order/verifyPayment';
}
