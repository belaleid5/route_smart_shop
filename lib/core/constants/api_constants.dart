abstract final class ApiConstants {
  ApiConstants._();

  // ================== Base URL ==================
  static const String baseUrl = "https://ecommerce.routemisr.com/api/";

  // ================== Auth ==================
  static const String signup = 'v1/auth/signup';
  static const String signin = 'v1/auth/signin';
  static const String forgotPassword = 'v1/auth/forgotPasswords';
  static const String verifyResetCode = 'v1/auth/verifyResetCode';
  static const String resetPassword = 'v1/auth/resetPassword';
  static const String users = 'v1/users';

  // ================== Products & Catalog ==================
  static const String products = 'v1/products';
  static const String productDetails = 'v1/products/{productId}';
  static const String categories = 'v1/categories';
  static const String subcategories = 'v1/categories/{categoryId}/subcategories';
  static const String brands = 'v1/brands';

  // ================== Wishlist ==================
  static const String wishlist = 'v1/wishlist';
  static const String addToWishlist = 'v1/wishlist';
  static const String removeFromWishlist = 'v1/wishlist/{productId}';

  // ================== Cart ==================
  static const String cart = 'v2/cart';
  static const String addToCart = 'v2/cart';
  static const String updateCartItem = 'v2/cart/{productId}';
  static const String removeCartItem = 'v2/cart/{productId}';
  static const String clearCart = 'v2/cart';

  // ================== Addresses ==================
  static const String addresses = 'v1/addresses';
  static const String addAddress = 'v1/addresses';
  static const String removeAddress = 'v1/addresses/{addressId}';

  // ================== Orders ==================
  static const String createCashOrder = 'v2/orders/{cartId}';
  static const String checkoutSession = 'v1/orders/checkout-session/{cartId}';
  static const String getUserOrders = 'v1/orders/user/{userId}';
  static const String getAllOrders = 'v1/orders';

  // ================== Reviews ==================
  static const String allReviews = 'v1/reviews';
  static const String reviewById = 'v1/reviews/{id}';
  static const String productReviews = 'v1/products/{productId}/reviews';
  static const String createReview = 'v1/products/{productId}/reviews';
  static const String updateReview = 'v1/reviews/{id}';
  static const String deleteReview = 'v1/reviews/{id}';

  // ================== Stripe ==================
  static const String stripeRedirectUrl = 'myapp://payment';

  // ================== Timeouts ==================
  static const Duration connectionTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);

  // ================== Headers ==================
  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';

  // ================== Storage Keys ==================
  static const String tokenKey = 'token';
}