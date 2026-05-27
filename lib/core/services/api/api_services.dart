import 'package:dio/dio.dart';
import 'package:route_smart/core/app/env_varible.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/data/model/product_response_model.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/core/constants/stripe_constants.dart';
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
import 'package:route_smart/features/checkout/data/models/address_data_model.dart';
import 'package:route_smart/features/checkout/data/models/order_model.dart';
import 'package:route_smart/features/checkout/data/models/stripe_models.dart';
import 'package:route_smart/features/details/data/models/product_details_response_model.dart';
import 'package:route_smart/features/home/data/models/sub_category_response_model.dart';
import 'package:route_smart/features/profile/data/models/users_response_model.dart';
import 'package:route_smart/features/reviews/data/models/create_review_request_model.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/data/models/reviews_response_model.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_request_model.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // ================== Auth ==================

  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    final response = await _dio.post(
      ApiConstants.signup,
      data: request.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  Future<AuthResponseModel> signIn(SignInRequestModel request) async {
    final response = await _dio.post(
      ApiConstants.signin,
      data: request.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  Future<MessageResponseModel> forgotPassword(
    ForgotPasswordRequestModel request,
  ) async {
    final response = await _dio.post(
      ApiConstants.forgotPassword,
      data: request.toJson(),
    );
    return MessageResponseModel.fromJson(response.data);
  }

  Future<VerificationCodeResponseModel> verifyResetCode(
    VerificationCodeRequestModel request,
  ) async {
    final response = await _dio.post(
      ApiConstants.verifyResetCode,
      data: request.toJson(),
    );
    return VerificationCodeResponseModel.fromJson(response.data);
  }

  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequestModel request,
  ) async {
    final response = await _dio.put(
      ApiConstants.resetPassword,
      data: request.toJson(),
    );
    return ResetPasswordResponse.fromJson(response.data);
  }

  // ================== Products & Catalog ==================

  Future<CategoryResponseModel> getCategories({
    int? page,
    int? limit,
    String? keyword,
  }) async {
    final queryParams = <String, dynamic>{};
    if (keyword != null && keyword.isNotEmpty) {
      queryParams['keyword'] = keyword;
    }
    final response = await _dio.get(
      ApiConstants.categories,
      queryParameters: queryParams.isEmpty ? null : queryParams,
    );
    return CategoryResponseModel.fromJson(response.data);
  }

  Future<SubcategoryResponseModel> getSubcategories(String categoryId) async {
    final url = ApiConstants.subcategories.replaceFirst(
      '{categoryId}',
      categoryId,
    );
    final response = await _dio.get(url);
    return SubcategoryResponseModel.fromJson(response.data);
  }

  Future<ProductResponseModel> getProducts({
    int? page,
    int? limit,
    String? sort,
    String? keyword,
    String? category,
    String? brand,
    String? subcategory,
    String? priceGte,
    String? priceLte,
  }) async {
    final queryParams = <String, dynamic>{};
    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;
    if (sort != null) queryParams['sort'] = sort;
    if (keyword != null && keyword.isNotEmpty) queryParams['keyword'] = keyword;
    if (category != null) queryParams['category'] = category;
    if (brand != null) queryParams['brand'] = brand;
    if (subcategory != null) queryParams['subcategory'] = subcategory;
    if (priceGte != null) queryParams['price[gte]'] = priceGte;
    if (priceLte != null) queryParams['price[lte]'] = priceLte;

    final response = await _dio.get(
      ApiConstants.products,
      queryParameters: queryParams.isEmpty ? null : queryParams,
    );
    return ProductResponseModel.fromJson(response.data);
  }

  Future<BrandResponseModel> getBrands({
    int? page,
    int? limit,
    String? keyword,
  }) async {
    final queryParams = <String, dynamic>{};
    if (keyword != null && keyword.isNotEmpty) {
      queryParams['keyword'] = keyword;
    }
    final response = await _dio.get(
      ApiConstants.brands,
      queryParameters: queryParams.isEmpty ? null : queryParams,
    );
    return BrandResponseModel.fromJson(response.data);
  }

  Future<ProductDetailsResponseModel> getProductDetails(
    String productId,
  ) async {
    final url = ApiConstants.productDetails.replaceFirst(
      '{productId}',
      productId,
    );
    final response = await _dio.get(url);
    return ProductDetailsResponseModel.fromJson(response.data);
  }

  // ================== Wishlist ==================

  Future<WishlistResponseModel> getWishlist() async {
    final response = await _dio.get(ApiConstants.wishlist);
    return WishlistResponseModel.fromJson(response.data);
  }

  Future<MessageResponseModel> addToWishlist(
    WishlistRequestModel request,
  ) async {
    final response = await _dio.post(
      ApiConstants.addToWishlist,
      data: request.toJson(),
    );
    return MessageResponseModel.fromJson(response.data);
  }

  Future<MessageResponseModel> removeFromWishlist(String productId) async {
    final url = ApiConstants.removeFromWishlist.replaceFirst(
      '{productId}',
      productId,
    );
    final response = await _dio.delete(url);
    return MessageResponseModel.fromJson(response.data);
  }

  // ================== Cart ==================

  Future<CartResponseModel> getCart() async {
    final response = await _dio.get(ApiConstants.cart);
    return CartResponseModel.fromJson(response.data);
  }

  Future<CartResponseModel> addToCart(CartRequestModel request) async {
    final response = await _dio.post(
      ApiConstants.addToCart,
      data: request.toJson(),
    );
    return CartResponseModel.fromJson(response.data);
  }

  Future<CartResponseModel> updateCartItemQuantity(
    String productId,
    UpdateCartItemRequestModel request,
  ) async {
    final url = ApiConstants.updateCartItem.replaceFirst(
      '{productId}',
      productId,
    );
    final response = await _dio.put(url, data: request.toJson());
    return CartResponseModel.fromJson(response.data);
  }

  Future<CartResponseModel> removeCartItem(String productId) async {
    final url = ApiConstants.removeCartItem.replaceFirst(
      '{productId}',
      productId,
    );
    final response = await _dio.delete(url);
    return CartResponseModel.fromJson(response.data);
  }

  Future<MessageResponseModel> clearCart() async {
    final response = await _dio.delete(ApiConstants.clearCart);
    return MessageResponseModel.fromJson(response.data);
  }

  // ================== Addresses ==================

  Future<List<AddressDataModel>> getAddresses() async {
    final response = await _dio.get(ApiConstants.addresses);
    return AddressDataModel.listFromJson(response.data);
  }

  Future<List<AddressDataModel>> addAddress(Map<String, dynamic> body) async {
    final response = await _dio.post(ApiConstants.addAddress, data: body);
    return AddressDataModel.listFromJson(response.data);
  }

  Future<List<AddressDataModel>> removeAddress(String addressId) async {
    final url = ApiConstants.removeAddress.replaceFirst(
      '{addressId}',
      addressId,
    );
    final response = await _dio.delete(url);
    return AddressDataModel.listFromJson(response.data);
  }


  Future<OrderModel> createCashOrder(
    String cartId,
    Map<String, dynamic> body,
  ) async {
    final url = ApiConstants.createCashOrder.replaceFirst('{cartId}', cartId);
    final response = await _dio.post(url, data: body);
    return OrderModel.fromJson(response.data);
  }

  Future<List<OrderModel>> getUserOrders(String userId) async {
    final url = ApiConstants.getUserOrders.replaceFirst('{userId}', userId);
    final response = await _dio.get(url);
    final List<dynamic> data = response.data;
    return data.map((json) => OrderModel.fromJson(json)).toList();
  }

  // ================== Stripe Checkout Session ==================

  Future<String> createCheckoutSession(
    String cartId,
    Map<String, dynamic> body,
  ) async {
    final url = ApiConstants.checkoutSession.replaceFirst('{cartId}', cartId);
    final response = await _dio.post(
      url,
      data: body,
      queryParameters: {'url': ApiConstants.stripeRedirectUrl},
    );

    final data = response.data as Map<String, dynamic>;
    final session = data['session'] as Map<String, dynamic>?;
    final sessionUrl = session?['url'] as String?;

    if (sessionUrl == null || sessionUrl.isEmpty) {
      throw Exception('Invalid session URL from server');
    }

    return sessionUrl;
  }

  // ================== Stripe Direct API ==================

  Map<String, String> get _stripeHeaders => {
        'Authorization': 'Bearer ${EnvVariable.instance.stripeSecretKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

  Future<PaymentIntentModel> createPaymentIntent({
    required int amount,
    required String currency,
  }) async {
    final response = await _dio.post(
      StripeConstants.paymentIntents,
      data: {'amount': amount, 'currency': currency},
      options: Options(
        headers: _stripeHeaders,
        contentType: 'application/x-www-form-urlencoded',
      ),
    );
    return PaymentIntentModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<EphemeralKeyModel> createEphemeralKey(String customerId) async {
    final response = await _dio.post(
      StripeConstants.ephemeralKeys,
      data: {'customer': customerId},
      options: Options(
        headers: {
          ..._stripeHeaders,
          'Stripe-Version': StripeConstants.stripeApiVersion,
        },
        contentType: 'application/x-www-form-urlencoded',
      ),
    );
    return EphemeralKeyModel.fromJson(response.data as Map<String, dynamic>);
  }

  // ================== Reviews ==================

  Future<ReviewsResponseModel> getAllReviews({int? page}) async {
    final response = await _dio.get(
      ApiConstants.allReviews,
      queryParameters: {'page': page},
    );
    return ReviewsResponseModel.fromJson(response.data);
  }

  Future<ReviewsResponseModel> getProductReviews({
    required String productId,
    int? page,
  }) async {
    final url = ApiConstants.productReviews.replaceFirst(
      '{productId}',
      productId,
    );
    final response = await _dio.get(url, queryParameters: {'page': page});
    return ReviewsResponseModel.fromJson(response.data);
  }

  Future<ReviewModel> getReviewById(String id) async {
    final url = ApiConstants.reviewById.replaceFirst('{id}', id);
    final response = await _dio.get(url);
    return ReviewModel.fromJson(response.data);
  }

  Future<void> createReview(
    String token,
    String productId,
    CreateReviewRequestModel body,
  ) async {
    final url = ApiConstants.createReview.replaceFirst(
      '{productId}',
      productId,
    );
    await _dio.post(
      url,
      data: body.toJson(),
      options: Options(headers: {'token': token}),
    );
  }

  Future<void> updateReview(
    String token,
    String id,
    CreateReviewRequestModel body,
  ) async {
    final url = ApiConstants.updateReview.replaceFirst('{id}', id);
    await _dio.put(
      url,
      data: body.toJson(),
      options: Options(headers: {'token': token}),
    );
  }

  Future<void> deleteReview(String token, String id) async {
    final url = ApiConstants.deleteReview.replaceFirst('{id}', id);
    await _dio.delete(url, options: Options(headers: {'token': token}));
  }

  // ================== Profile ==================

  Future<UsersResponseModel> getUsers() async {
    final response = await _dio.get(ApiConstants.users);
    return UsersResponseModel.fromJson(response.data);
  }
}