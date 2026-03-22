class AppRegex {
  // ================= Email Validation =================
  static bool isEmailValid(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  // ================= Password Validation =================
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$',
    ).hasMatch(password);
  }

  // ================= Egyptian Phone Validation =================
  static bool isPhoneNumberValid(String phoneNumber) {
    // Egyptian phone: starts with 010, 011, 012, or 015 + 8 digits
    return RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(phoneNumber);
  }

  // ================= International Phone Validation =================
  static bool isInternationalPhoneValid(String phoneNumber) {
    // Accepts +, spaces, hyphens, and 10-15 digits
    final cleaned = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    return cleaned.length >= 10 && cleaned.length <= 15;
  }

  // ================= Password Requirements =================
  static bool hasLowerCase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'\d').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  static bool hasMinLength(String password, [int minLength = 8]) {
    return password.length >= minLength;
  }

  // ================= Username Validation =================
  static bool isUsernameValid(String username) {
    // 3-20 characters, letters, numbers, underscore, hyphen
    return RegExp(r'^[a-zA-Z0-9_-]{3,20}$').hasMatch(username);
  }

  // ================= URL Validation =================
  static bool isUrlValid(String url) {
    return RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    ).hasMatch(url);
  }

  // ================= Credit Card Validation =================
  static bool isCreditCardValid(String cardNumber) {
    final cleaned = cardNumber.replaceAll(RegExp(r'\s'), '');
    return RegExp(r'^\d{13,19}$').hasMatch(cleaned);
  }

  // ================= Postal Code Validation =================
  static bool isPostalCodeValid(String postalCode) {
    // 5 digits
    return RegExp(r'^\d{5}$').hasMatch(postalCode);
  }
}

  
