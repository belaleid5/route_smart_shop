class ApiConstants {
  static const String baseUrl = 'https://qent.azurewebsites.net/api';

  // Endpoints
  static const String carsEndpoint = '$baseUrl/cars';
  static const String carDetailsEndpoint = '$baseUrl/cars';
  static const String searchEndpoint = '$baseUrl/cars/search';
  static const String updateCarEndpoint = '$baseUrl/cars';
  static const String deleteCarEndpoint = '$baseUrl/cars';
  static const String brandsEndpoint = '$baseUrl/brands';
  static const String nerestCarsEndpoint = '$baseUrl/cars/nearest';

  //Auth Endpoints
  static const String loginEndpoint = '$baseUrl/auth/login/';
  static const String verifyCodePhoneEndpoint =
      '/auth/phone/request_verify_code/';
  static const String registerEndpoint = '$baseUrl/auth/register/';
  static const String registerLocationsEndpoint =
      '$baseUrl/public/register_locations';
  static const String confirmCodeEndpoint =
      '$baseUrl/auth/phone/confirm_verify_code/';
  static const String forgotPasswordEndpoint = '$baseUrl/auth/forgot_password/';
  static const String resetPasswordEndpoint = '$baseUrl/auth/reset_password/';
  
  
  //Reviews

     static const String reviewsEndpoint = '$baseUrl/cars/1/reviews/add';
  
  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);

  // Headers
  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';
}
