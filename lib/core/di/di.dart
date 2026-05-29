import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/common/data/data_source/all_products_data_source.dart';
import 'package:route_smart/core/common/data/repo/brands_repository_impl.dart';
import 'package:route_smart/core/common/data/repo/categories_repository_impl.dart';
import 'package:route_smart/core/common/data/repo/search_catalog_repository_impl.dart';
import 'package:route_smart/core/common/data/repo/products_repository_impl.dart';
import 'package:route_smart/core/common/domain/usease/get_brands_use_case.dart';
import 'package:route_smart/core/common/domain/usease/get_categories_use_case.dart';
import 'package:route_smart/core/common/domain/usease/get_products_use_case.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/core/services/api/auth_interceptor.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/features/auth_feature/data/data_source/auth_data_source.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';
import 'package:route_smart/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:route_smart/features/cart/data/repo/cart_repo_imp.dart';
import 'package:route_smart/features/cart/domain/repo/cart_repository.dart';
import 'package:route_smart/features/cart/domain/usecase/add_to_cart_use_case.dart';
import 'package:route_smart/features/cart/domain/usecase/clear_cart_use_case.dart';
import 'package:route_smart/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:route_smart/features/cart/domain/usecase/remove_cart_item_use_case.dart';
import 'package:route_smart/features/cart/domain/usecase/update_cart_item_quantity_use_case.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/category_details/data/data_source/subcategory_remote_data_source.dart';
import 'package:route_smart/features/category_details/data/repo/category_details_repo.dart';
import 'package:route_smart/features/category_details/domain/repo/category_details_repository.dart';
import 'package:route_smart/features/category_details/domain/usecase/get_subcategories_use_case.dart';
import 'package:route_smart/features/category_details/presention/manger/category_details_cubit.dart';
import 'package:route_smart/features/checkout/data/data_source/checkout_remote_datasource.dart';
import 'package:route_smart/features/checkout/data/data_source/stripe_remote_datasource.dart';
import 'package:route_smart/features/checkout/data/repo/checkout_repository_impl.dart';
import 'package:route_smart/features/checkout/data/repo/stripe_repository_impl.dart';
import 'package:route_smart/features/checkout/domain/repo/checkout_repository.dart';
import 'package:route_smart/features/checkout/domain/repo/stripe_repository.dart';
import 'package:route_smart/features/checkout/domain/usecase/checkout_usecases.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/details/data/data_source/product_details_data_source.dart';
import 'package:route_smart/features/details/data/repo/product_details_repo_imp.dart';
import 'package:route_smart/features/details/domain/repo/product_details_repo.dart';
import 'package:route_smart/features/details/domain/usecase/get_product_details_use_case.dart';
import 'package:route_smart/features/details/presention/manger/product_details_bloc.dart';
import 'package:route_smart/features/home/domain/repo/brands_repository.dart';
import 'package:route_smart/features/home/domain/repo/categories_repository.dart';
import 'package:route_smart/features/home/domain/repo/products_repository.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/profile/data/data_source/user_data_source.dart';
import 'package:route_smart/features/profile/data/repo/user_repo.dart';
import 'package:route_smart/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:route_smart/features/profile/domain/repo/profile_repo.dart';
import 'package:route_smart/features/profile/presention/manger/profile_bloc.dart';
import 'package:route_smart/features/reviews/data/data_source/reviews_remote_data_source.dart';
import 'package:route_smart/features/reviews/data/repo/reviews_repository_impl.dart';
import 'package:route_smart/features/reviews/domain/repo/reviews_repository.dart';
import 'package:route_smart/features/reviews/domain/usecase/create_review_use_case.dart';
import 'package:route_smart/features/reviews/domain/usecase/delete_review_use_case.dart';
import 'package:route_smart/features/reviews/domain/usecase/get_product_reviews_use_case.dart';
import 'package:route_smart/features/reviews/domain/usecase/update_review_use_case.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/search/domain/repo/search_category_repo.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:route_smart/features/wishlist/data/repo/wishlist_repository_impl.dart';
import 'package:route_smart/features/wishlist/domain/repo/wishlist_repository.dart';
import 'package:route_smart/features/wishlist/domain/usecase/add_to_wishlist_use_case.dart';
import 'package:route_smart/features/wishlist/domain/usecase/get_wishlist_use_case.dart';
import 'package:route_smart/features/wishlist/domain/usecase/remove_from_wishlist_use_case.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDI() async {
  _initCore();
  _initAuth();
  _initHome();
  _initSearch();
  _initCart();
  _initCheckout();
  _initCategoryDetails();
  _initWishlist();
  _initReviews();
  _initProfile();
  _initProductDetails();
}

void _initCore() {
  sl.registerLazySingleton<SecureStorage>(() => SecureStorage());

  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.add(AuthInterceptor(sl<SecureStorage>())),
  );

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<AppCubit>(() => AppCubit());
}

void _initAuth() {
  sl.registerLazySingleton<AuthRemoteDataSourceImpl>(
    () => AuthRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(
      sl<AuthRemoteDataSourceImpl>(),
      sl<SecureStorage>(),
    ),
  );

  sl.registerFactory(() => SignInBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => RegisterBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => ForgotPasswordBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => VerifyCodeBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => ResetPasswordBloc(sl<AuthRepositoryImpl>()));
}

void _initHome() {
  sl.registerLazySingleton<AllDataProductsRemoteDataSource>(
    () => AllDataProductsRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<BrandsRepository>(
    () => BrandsRepositoryImpl(sl<AllDataProductsRemoteDataSource>()),
  );

  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(sl<AllDataProductsRemoteDataSource>()),
  );

  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(sl<AllDataProductsRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetBrandsUseCase>(
    () => GetBrandsUseCase(sl<BrandsRepository>()),
  );

  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl<CategoriesRepository>()),
  );

  sl.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(sl<ProductsRepository>()),
  );

  sl.registerLazySingleton<BrandsBloc>(
    () => BrandsBloc(sl<GetBrandsUseCase>()),
  );

  sl.registerLazySingleton<CategoriesBloc>(
    () => CategoriesBloc(sl<GetCategoriesUseCase>()),
  );

  sl.registerLazySingleton<ProductsBloc>(
    () => ProductsBloc(sl<GetProductsUseCase>()),
  );
}

void _initSearch() {
  sl.registerLazySingleton<SearchCatalogRepository>(
    () => SearchCatalogRepositoryImpl(
      sl<AllDataProductsRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton(
    () => SearchBloc(
      searchCatalogRepository: sl<SearchCatalogRepository>(),
    ),
  );
}

void _initCart() {
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(apiService: sl<ApiService>()),
  );

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(remoteDataSource: sl<CartRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetCartUseCase>(
    () => GetCartUseCase(sl<CartRepository>()),
  );
  sl.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(sl<CartRepository>()),
  );
  sl.registerLazySingleton<UpdateCartItemUseCase>(
    () => UpdateCartItemUseCase(sl<CartRepository>()),
  );
  sl.registerLazySingleton<RemoveCartItemUseCase>(
    () => RemoveCartItemUseCase(sl<CartRepository>()),
  );
  sl.registerLazySingleton<ClearCartUseCase>(
    () => ClearCartUseCase(sl<CartRepository>()),
  );

  sl.registerLazySingleton<CartBloc>(
    () => CartBloc(
      getCartUseCase: sl<GetCartUseCase>(),
      addToCartUseCase: sl<AddToCartUseCase>(),
      updateCartItemUseCase: sl<UpdateCartItemUseCase>(),
      removeCartItemUseCase: sl<RemoveCartItemUseCase>(),
      clearCartUseCase: sl<ClearCartUseCase>(),
    ),
  );
}

void _initCheckout() {
  sl.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<StripeRemoteDataSource>(
    () => StripeRemoteDataSourceImpl(
      ApiService(
        Dio(
          BaseOptions(
            connectTimeout: ApiConstants.connectionTimeout,
            receiveTimeout: ApiConstants.receiveTimeout,
          ),
        ),
      ),
    ),
  );

  sl.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepositoryImpl(sl<CheckoutRemoteDataSource>()),
  );

  sl.registerLazySingleton<StripeRepository>(
    () => StripeRepositoryImpl(sl<StripeRemoteDataSource>()),
  );

  sl.registerLazySingleton(
    () => GetAddressesUseCase(sl<CheckoutRepository>()),
  );
  sl.registerLazySingleton(
    () => AddAddressUseCase(sl<CheckoutRepository>()),
  );
  sl.registerLazySingleton(
    () => RemoveAddressUseCase(sl<CheckoutRepository>()),
  );
  sl.registerLazySingleton(
    () => CreateCashOrderUseCase(sl<CheckoutRepository>()),
  );
  sl.registerLazySingleton(
    () => MakeStripePaymentUseCase(sl<StripeRepository>()),
  );

  sl.registerFactory(
    () => CheckoutBloc(
      getAddresses: sl<GetAddressesUseCase>(),
      addAddress: sl<AddAddressUseCase>(),
      removeAddress: sl<RemoveAddressUseCase>(),
      createCashOrder: sl<CreateCashOrderUseCase>(),
      makeStripePayment: sl<MakeStripePaymentUseCase>(),
    ),
  );
}

void _initCategoryDetails() {
  sl.registerLazySingleton<SubcategoryRemoteDataSource>(
    () => SubcategoryRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<CategoryDetailsRepository>(
    () => CategoryDetailsRepositoryImpl(sl<SubcategoryRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetSubcategoriesUseCase>(
    () => GetSubcategoriesUseCase(sl<CategoryDetailsRepository>()),
  );

  sl.registerFactory(() => CategoryDetailsBloc(sl<GetSubcategoriesUseCase>()));
}

void _initWishlist() {
  sl.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(sl<WishlistRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetWishlistUseCase>(
    () => GetWishlistUseCase(sl<WishlistRepository>()),
  );
  sl.registerLazySingleton<AddToWishlistUseCase>(
    () => AddToWishlistUseCase(sl<WishlistRepository>()),
  );
  sl.registerLazySingleton<RemoveFromWishlistUseCase>(
    () => RemoveFromWishlistUseCase(sl<WishlistRepository>()),
  );

  sl.registerLazySingleton<WishlistBloc>(
    () => WishlistBloc(
      getWishlistUseCase: sl<GetWishlistUseCase>(),
      addToWishlistUseCase: sl<AddToWishlistUseCase>(),
      removeFromWishlistUseCase: sl<RemoveFromWishlistUseCase>(),
    ),
  );
}

void _initReviews() {
  sl.registerLazySingleton<ReviewsRemoteDataSource>(
    () => ReviewsRemoteDataSourceImpl(sl<ApiService>(), sl<SecureStorage>()),
  );

  sl.registerLazySingleton<ReviewsRepository>(
    () => ReviewsRepositoryImpl(sl<ReviewsRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetProductReviewsUseCase>(
    () => GetProductReviewsUseCase(sl<ReviewsRepository>()),
  );
  sl.registerLazySingleton<CreateReviewUseCase>(
    () => CreateReviewUseCase(sl<ReviewsRepository>()),
  );
  sl.registerLazySingleton<DeleteReviewUseCase>(
    () => DeleteReviewUseCase(sl<ReviewsRepository>()),
  );
  sl.registerLazySingleton<UpdateReviewUseCase>(
    () => UpdateReviewUseCase(sl<ReviewsRepository>()),
  );

  sl.registerFactory(
    () => ReviewsBloc(
      sl<GetProductReviewsUseCase>(),
      sl<CreateReviewUseCase>(),
      sl<DeleteReviewUseCase>(),
      sl<UpdateReviewUseCase>(),
    ),
  );
}

void _initProfile() {
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl<ProfileRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetProfileUseCase>(
    () => GetProfileUseCase(sl<ProfileRepository>(), sl<SecureStorage>()),
  );

  sl.registerLazySingleton(() => ProfileBloc(sl<GetProfileUseCase>()));
}

void _initProductDetails() {
  sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(sl<ProductDetailsRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetProductDetailsUseCase>(
    () => GetProductDetailsUseCase(sl<ProductDetailsRepository>()),
  );

  sl.registerFactory(() => ProductDetailsBloc(sl<GetProductDetailsUseCase>()));
}