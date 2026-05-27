// core/language/lang_keys.dart

abstract final class LangKeys {
  LangKeys._();

  // ============= BASIC =============
  static const String appName = 'app_name';
  static const String language = 'language';
  static const String arabic = 'arabic';
  static const String english = 'english';
  static const String yes = 'yes';
  static const String no = 'no';
  static const String cancel = 'cancel';
  static const String sure = 'sure';
  static const String reset = 'reset';
  static const String edit = 'edit';
  static const String retry = 'retry';
  static const String seeAll = 'see_all';
  static const String viewAll = 'view_all';
  static const String viewProducts = 'view_products';
  static const String viewProduct = 'view_product';

  // ============= AUTHENTICATION =============
  static const String login = 'login';
  static const String signUp = 'sign_up';
  static const String createAccount = 'create_account';
  static const String forgotPassword = 'forgot_password';
  static const String welcome = 'welcome';
  static const String welcomeBack = 'welcome_back';
  static const String signInToContinue = 'sign_in_to_continue';
  static const String signUpWelcome = 'sign_up_welcome';
  static const String dontHaveAccount = 'dont_have_account';
  static const String youHaveAccount = 'you_have_account';
  static const String orContinueWith = 'or_continue_with';
  static const String termsAndPrivacy = 'terms_and_privacy';

  // ============= VALIDATION =============
  static const String emailAddress = 'email_address';
  static const String yourEmail = 'your_email';
  static const String password = 'password';
  static const String newPassword = 'new_password';
  static const String confirmPassword = 'confirm_password';
  static const String phoneNumber = 'phone_number';
  static const String fullName = 'full_name';
  static const String forgotPasswordSubtitle = 'forgot_password_subtitle';

  static const String validEmail = 'valid_email';
  static const String validPassword = 'valid_passwrod'; // ⚠️ Keep as is for JSON compatibility
  static const String validName = 'valid_name';
  static const String validPickImage = 'valid_pick_image';

  // ============= MESSAGES =============
  static const String loggedSuccessfully = 'logged_successfully';
  static const String loggedError = 'logged_error';
  static const String accountCreatedSuccess = 'account_created_success';
  static const String codeVerifiedSuccessfully = 'code_verified_successfully';
  static const String passwordUpdatedSuccess = 'password_updated_success';
  static const String imageUploaded = 'image_uploaded';
  static const String imageRemoved = 'image_removed';

  // ============= VERIFICATION =============
  static const String verification = 'verification';
  static const String verifyCode = 'verify_code';
  static const String verifyCodeSubtitle = 'verify_code_subtitle';
  static const String resetPassword = 'reset_password';
  static const String resetPasswordSubtitle = 'reset_password_subtitle';
  static const String didntReceiveCode = 'didnt_receive_code';
  static const String resendCode = 'resend_code';
  static const String backToLogin = 'back_to_login';

  // ============= ADDRESS =============
  static const String address = 'address';
  static const String addressName = 'address_name';
  static const String addressDetails = 'address_details';
  static const String addressPhone = 'address_phone';
  static const String addressCity = 'address_city';
  static const String addressNameHint = 'address_name_hint';
  static const String addressDetailsHint = 'address_details_hint';
  static const String addressCityHint = 'address_city_hint';
  static const String addAddress = 'add_address';
  static const String addAddressSubtitle = 'add_address_subtitle';
  static const String saveAddress = 'save_address';
  static const String noAddressFound = 'no_address_found';
  static const String pleaseSelectAddress = 'please_select_address';

  // ✅ ADDRESS VALIDATION
  static const String errorEnterName = 'error_enter_name';
  static const String errorEnterDetails = 'error_enter_details';
  static const String errorEnterPhone = 'error_enter_phone';
  static const String errorEnterCity = 'error_enter_city';

  // ============= PRODUCTS =============
  static const String products = 'products';
  static const String noProductsFound = 'no_products_found';
  static const String chooseProducts = 'choose_products';
  static const String detailProduct = 'detail_product';
  static const String applicationFeatures = 'application_features';

  // ============= CATEGORIES =============
  static const String categories = 'categories';
  static const String allCategories = 'all_categories';
  static const String noCategoriesFound = 'no_categories_found';
  static const String noSubcategoriesFound = 'no_subcategories_found';

  // ============= BRANDS =============
  static const String brands = 'brands';
  static const String popularBrands = 'popular_brands';
  static const String brandsComingSoon = 'brands_coming_soon';
  static const String noBrandsAvailable = 'no_brands_available';
  static const String unknownBrand = 'unknown_brand';

  // ============= DEALS & PRODUCTS =============
  static const String flashDeals = 'flash_deals';
  static const String noFlashDealsAvailable = 'no_flash_deals_available';
  static const String recommendedForYou = 'recommended_for_you';
  static const String recentlyViewed = 'recently_viewed';
  static const String addedToWishlist = 'added_to_wishlist';
  static const String wishlist = 'wishlist';

  // ============= CART =============
  static const String cart = 'cart';
  static const String quantity = 'quantity';
  static const String price = 'price';
  static const String totalAmount = 'total_amount';
  static const String addToCart = 'add_to_cart';
  static const String productAddedToCart = 'product_added_to_cart';
  static const String productAlreadyInCart = 'product_already_in_cart';
  static const String chooseAmount = 'choose_amount';
  static const String noItemsInCart = 'no_items_in_cart';
  static const String cartEmpty = 'cart_empty';
  static const String clearAll = 'clear_all';
  static const String cartCleared = 'cart_cleared';
  static const String itemRemoved = 'item_removed';
  static const String quantityUpdated = 'quantity_updated';

  // ============= CHECKOUT & PAYMENT =============
  static const String checkout = 'checkout';
  static const String checkoutNow = 'checkout_now';
  static const String payment = 'payment';
  static const String paymentMethod = 'payment_method';
  static const String pleaseSelectPaymentMethod = 'please_select_payment_method';
  static const String cashOnDelivery = 'cash_on_delivery';
  static const String payOnReceive = 'pay_on_receive';
  static const String creditCard = 'credit_card';
  static const String paySecurelyStripe = 'pay_securely_stripe';
  static const String paymentSuccessful = 'paymentSuccessful';
  static const String thankYou = 'thankYou';
  static const String processingPayment = 'processingPayment';
  static const String pleaseWait = 'pleaseWait';

  // ============= REVIEWS =============
  static const String reviews = 'reviews';
  static const String review = 'review';
  static const String viewAllReviews = 'view_all_reviews';
  static const String submitReview = 'submit_review';
  static const String updateReview = 'update_review';
  static const String follow = 'follow';
  static const String readMore = 'read_more';
  static const String readLess = 'read_less';
  static const String email = 'email';
  
  // ✅ تمت إضافته هنا
  static const String reviewAlreadyAdded = 'review_already_added'; 

  // ============= SORTING & FILTERING =============
  static const String sort = 'sort';
  static const String sortBy = 'sort_by';
  static const String sortDefault = 'sort_default';
  static const String sortPopular = 'sort_popular';
  static const String sortTopRated = 'sort_top_rated';
  static const String sortAToZ = 'sort_a_to_z';
  static const String sortZToA = 'sort_z_to_a';
  static const String sortPriceLow = 'sort_price_low';
  static const String sortPriceHigh = 'sort_price_high';
  static const String filters = 'filters';
  static const String applyFilters = 'apply_filters';
  static const String showingXOfY = 'showing_x_of_y';

  // ============= SEARCH & BROWSE =============
  static const String search = 'search';
  static const String discover = 'discover';
  static const String searchSubtitle = 'search_subtitle';
  static const String tryDifferentSearch = 'try_different_search';
  static const String home = 'home';
  static const String all = 'all';

  // ============= PROFILE & SETTINGS =============
  static const String profile = 'profile';
  static const String myOrder = 'my_order';
  static const String languageTitle = 'language_tilte';
  static const String langCode = 'lang_code';
  static const String changeToTheLanguage = 'change_to_the_language';
  static const String darkMode = 'dark_mode';
  static const String buildVersion = 'build_version';
  static const String buildDeveloper = 'build_developer';
  static const String logOut = 'log_out';
  static const String logOutFromApp = 'log_out_from_app';

  // ============= NOTIFICATIONS =============
  static const String notifications = 'notifications';
  static const String subscribedToNotifications = 'subscribed_to_notifications';
  static const String unsubscribedToNotifications = 'unsubscribed_to_notifications';

  // ============= NETWORK & ERRORS =============
  static const String noNetwork = 'no_network';
  static const String noNetworkMessage = 'no_network_message';
  static const String errorNoContent = 'error_no_content';
  static const String errorBadRequest = 'error_bad_request';
  static const String errorUnauthorized = 'error_unauthorized';
  static const String errorForbidden = 'error_forbidden';
  static const String errorServer = 'error_server';
  static const String errorNotFound = 'error_not_found';
  static const String errorTimeout = 'error_timeout';
  static const String errorCache = 'error_cache';
  static const String errorNoInternet = 'error_no_internet';
  static const String errorDefault = 'error_default';

  // ============= MISC =============
  static const String currency = 'currency_symbol';
  
  static const String currencySymbol = 'currency_symbol'; 
  
  static const String noUsersFound = 'no_users_found';
  static const String uncategorized = 'no_categories_found';
  static const String noTitle = 'no_products_found';
  static const String goodMorning = 'welcome';
  static const String userName = 'full_name';
   static const String allBrands = 'all_brands';
}