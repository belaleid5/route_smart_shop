abstract final class ApiConstants {
static const String baseUrl = "https://ecommerce.routemisr.com/api/v1/";

  // ================== Auth ==================
  // ✅ endpoints بدون / في الأول
  static const String signup = 'auth/signup';
  static const String signin = 'auth/signin';
static const String forgotPassword = 'auth/forgotPasswords';
static const String verifyResetCode = 'auth/verifyResetCode';

  // ================== Products ==================
  static const String products = 'products';

  // ================== Categories ==================
  static const String categories = 'categories';

  // ================== Cart ==================
  static const String cart = 'cart';

  // ================== Orders ==================
  static String checkoutSession(String cartId) =>
      'orders/checkout-session/$cartId';

  static String userOrders(String userId) => 'orders/user/$userId';

  // ================== Timeouts ==================
  static const Duration connectionTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);

  // ================== Headers ==================
  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';
}