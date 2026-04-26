import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/data/model/product_response_model.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/features/auth_feature/data/models/auth_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_response.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_in/sign_in_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/response_verification_code_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';
import 'package:route_smart/features/cart/data/models/cart_request_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/data/models/update_cart_item_request_model.dart';
import 'package:route_smart/features/checkout/data/models/address_response_model.dart';
import 'package:route_smart/features/checkout/data/models/order_response_model.dart';
import 'package:route_smart/features/checkout/data/models/stripe/ephemeral_key_response_model.dart';
import 'package:route_smart/features/checkout/data/models/stripe/payment_intent_response_model.dart';
import 'package:route_smart/features/details/data/models/product_details_response_model.dart';
import 'package:route_smart/features/reviews/data/models/create_review_request_model.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/data/models/reviews_response_model.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_request_model.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // ══════════════════════════════════════════════════════════════
  // Auth
  // ══════════════════════════════════════════════════════════════

  @POST(ApiConstants.signup)
  Future<AuthResponseModel> register(
    @Body() RegisterRequestModel registerRequest,
  );

  @POST(ApiConstants.signin)
  Future<AuthResponseModel> signIn(
    @Body() SignInRequestModel signInRequest,
  );

  @POST(ApiConstants.forgotPassword)
  Future<MessageResponseModel> forgotPassword(
    @Body() ForgotPasswordRequestModel forgotPasswordRequest,
  );

  @POST(ApiConstants.verifyResetCode)
  Future<VerificationCodeResponseModel> verifyResetCode(
    @Body() VerificationCodeRequestModel forgotPasswordRequest,
  );

  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequestModel resetPasswordRequest,
  );

  // ══════════════════════════════════════════════════════════════
  // Categories, Products, Brands
  // ══════════════════════════════════════════════════════════════

  @GET(ApiConstants.categories)
  Future<CategoryResponseModel> getCategories(
    @Query("page") int page,
    @Query("limit") int limit,
    @Query("keyword") String? keyword,
  );

  @GET(ApiConstants.products)
  Future<ProductResponseModel> getProducts(
    @Query("page") int page,
    @Query("limit") int limit,
    @Query("sort") String? sort,
    @Query("keyword") String? keyword,
    @Query("category") String? category,
    @Query("brand") String? brand,
    @Query("subcategory") String? subcategory,
    @Query("price[gte]") String? priceGte,
    @Query("price[lte]") String? priceLte,
  );

  @GET(ApiConstants.brands)
  Future<BrandResponseModel> getBrands(
    @Query("page") int page,
    @Query("limit") int limit,
    @Query("keyword") String? keyword,
  );

  // ══════════════════════════════════════════════════════════════
  // Product Details
  // ══════════════════════════════════════════════════════════════

  @GET(ApiConstants.productDetails)
  Future<ProductDetailsResponseModel> getProductDetails(
    @Path("productId") String productId,
  );

  // ══════════════════════════════════════════════════════════════
  // Wishlist
  // ══════════════════════════════════════════════════════════════

  @GET(ApiConstants.wishlist)
  Future<WishlistResponseModel> getWishlist(
    @Header('token') String token,
  );

  @POST(ApiConstants.addToWishlist)
  Future<MessageResponseModel> addToWishlist(
    @Header('token') String token,
    @Body() WishlistRequestModel request,
  );

  @DELETE(ApiConstants.removeFromWishlist)
  Future<MessageResponseModel> removeFromWishlist(
    @Header('token') String token,
    @Path("productId") String productId,
  );

  // ══════════════════════════════════════════════════════════════
  // Cart
  // ══════════════════════════════════════════════════════════════

  @GET(ApiConstants.cart)
  Future<CartResponseModel> getCart(
    @Header('token') String token,
  );

  @POST(ApiConstants.addToCart)
  Future<CartResponseModel> addToCart(
    @Header('token') String token,
    @Body() CartRequestModel request,
  );

  @PUT(ApiConstants.updateCartItem)
  Future<CartResponseModel> updateCartItemQuantity(
    @Header('token') String token,
    @Path("productId") String productId,
    @Body() UpdateCartItemRequestModel request,
  );

  @DELETE(ApiConstants.removeCartItem)
  Future<CartResponseModel> removeCartItem(
    @Header('token') String token,
    @Path("productId") String productId,
  );

  @DELETE(ApiConstants.cart)
  Future<MessageResponseModel> clearCart(
    @Header('token') String token,
  );

  // ══════════════════════════════════════════════════════════════
  // Addresses
  // ══════════════════════════════════════════════════════════════

  @GET(ApiConstants.addresses)
  Future<AddressResponseModel> getAddresses(
    @Header('token') String token,
  );

  @POST(ApiConstants.addAddress)
  Future<AddressResponseModel> addAddress(
    @Header('token') String token,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(ApiConstants.removeAddress)
  Future<AddressResponseModel> removeAddress(
    @Header('token') String token,
    @Path('addressId') String addressId,
  );

  // ══════════════════════════════════════════════════════════════
  // Orders
  // ══════════════════════════════════════════════════════════════

  @POST(ApiConstants.createCashOrder)
  Future<OrderResponseModel> createCashOrder(
    @Header('token') String token,
    @Path('cartId') String cartId,
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.getUserOrders)
  Future<List<OrderResponseModel>> getUserOrders(
    @Path('userId') String userId,
  );

  // ══════════════════════════════════════════════════════════════
  // Stripe (Full URL — different baseUrl)
  // ══════════════════════════════════════════════════════════════

  @POST(ApiConstants.createPaymentIntent)
  @FormUrlEncoded()
  Future<PaymentIntentResponseModel> createPaymentIntent(
    @Header('Authorization') String authorization,
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.createEphemeralKey)
  @FormUrlEncoded()
  Future<EphemeralKeyResponseModel> createEphemeralKey(
    @Header('Authorization') String authorization,
    @Header('Stripe-Version') String stripeVersion,
    @Body() Map<String, dynamic> body,
  );

  // ══════════════════════════════════════════════════════════════
  // Reviews
  // ══════════════════════════════════════════════════════════════

  @GET(ApiConstants.allReviews)
  Future<ReviewsResponseModel> getAllReviews(
    @Query("page") int? page,
  );

  @GET(ApiConstants.productReviews)
  Future<ReviewsResponseModel> getProductReviews(
    @Path("productId") String productId,
    @Query("page") int? page,
  );

  @GET(ApiConstants.reviewById)
  Future<ReviewModel> getReviewById(
    @Path("id") String id,
  );

  @POST(ApiConstants.createReview)
  Future<void> createReview(
    @Header('token') String token,
    @Path("productId") String productId,
    @Body() CreateReviewRequestModel body,
  );

  @PUT(ApiConstants.updateReview)
  Future<void> updateReview(
    @Header('token') String token,
    @Path("id") String id,
    @Body() CreateReviewRequestModel body,
  );

  @DELETE(ApiConstants.deleteReview)
  Future<void> deleteReview(
    @Header('token') String token,
    @Path("id") String id,
  );
}