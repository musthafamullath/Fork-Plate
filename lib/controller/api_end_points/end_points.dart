class ApiEndPoints {
  static const String baseUrl = 'http://10.0.2.2:8989';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String verifyOtp = '/verifyOtp';
  static const getUserProfile = '/profile';
  static const updateUserProfile = '/profile/edit';
  static const getDishesByCategory = '/dishes?l=10&category=';
  static const getDishesBySeller = '/dishes?seller=';
  static const searchSeller = '/search/sellers?q=';
    static const getSellerById = '/user/sellers/';
}
