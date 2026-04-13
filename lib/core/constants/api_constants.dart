abstract final class ApiConstants {
  static const String baseUrl = "https://ecommerce.routemisr.com/api/";

  // ================== Auth ==================
  static const String signup = 'v1/auth/signup';
  static const String signin = 'v1/auth/signin';
  static const String forgotPassword = 'v1/auth/forgotPasswords';
  static const String verifyResetCode = 'v1/auth/verifyResetCode';
  static const String resetPassword = 'v1/auth/resetPassword';

  // ================== Wishlist ==================
  static const String wishlist = "v1/wishlist";
  static const String addToWishlist = "v1/wishlist";
  static const String removeFromWishlist = "v1/wishlist/{productId}";

  // ================== Products ==================
  static const String products = 'v1/products';

  // ================== Categories ==================
  static const String categories = 'v1/categories';

  // ================== Brands ==================
  static const String brands = 'v1/brands';

  // ================== Orders ==================
  static String checkoutSession(String cartId) =>
      'v1/orders/checkout-session/$cartId';

  static String userOrders(String userId) => 'v1/orders/user/$userId';

  // ================== Cart ==================
 static const String cart           = 'v2/cart';
static const String addToCart      = 'v2/cart';
static const String updateCartItem = 'v2/cart/{productId}'; 
static const String removeCartItem = 'v2/cart/{productId}'; 
static const String clearCart      = 'v2/cart';

  // ================== Timeouts ==================
  static const Duration connectionTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);

  // ================== Headers ==================
  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';
}