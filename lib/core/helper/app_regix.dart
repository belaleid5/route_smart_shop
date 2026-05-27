abstract final class AppRegex {
  AppRegex._();

  // ================= Email Validation =================
  static bool isEmailValid(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  // ================= Password Validation =================
  // 8+ chars, 1 upper, 1 lower, 1 number, 1 special char
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$',
    ).hasMatch(password);
  }

  // ================= Egyptian Phone Validation =================
  // Starts with 010, 011, 012, or 015 followed by 8 digits
  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(phoneNumber);
  }

  // ================= International Phone Validation =================
  // Accepts +, spaces, hyphens, and ensures 10-15 digits total
  static bool isInternationalPhoneValid(String phoneNumber) {
    final cleaned = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    return cleaned.length >= 10 && cleaned.length <= 15;
  }

  // ================= Password Requirements Helpers =================
  static bool hasLowerCase(String password) => RegExp(r'[a-z]').hasMatch(password);
  static bool hasUpperCase(String password) => RegExp(r'[A-Z]').hasMatch(password);
  static bool hasNumber(String password) => RegExp(r'\d').hasMatch(password);
  
   static bool hasSpecialCharacter(String password) {
  return RegExp(
    r'[^\w\s]',
  ).hasMatch(password);
}

  static bool hasMinLength(String text, [int minLength = 8]) {
    return text.length >= minLength;
  }

  // ================= Username Validation =================
  // 3-20 characters, allows letters, numbers, underscore, hyphen
  static bool isUsernameValid(String username) {
    return RegExp(r'^[a-zA-Z0-9_-]{3,20}$').hasMatch(username);
  }

  // ================= URL Validation =================
  static bool isUrlValid(String url) {
    return RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    ).hasMatch(url);
  }

  // ================= Credit Card Validation (Basic Length Check) =================
  // Note: For real validation, use Luhn Algorithm. This checks length only.
  static bool isCreditCardValid(String cardNumber) {
    final cleaned = cardNumber.replaceAll(RegExp(r'\s|-'), '');
    return RegExp(r'^\d{13,19}$').hasMatch(cleaned);
  }

  // ================= Postal Code Validation (Generic 5 Digits) =================
  static bool isPostalCodeValid(String postalCode) {
    return RegExp(r'^\d{5}$').hasMatch(postalCode);
  }
}