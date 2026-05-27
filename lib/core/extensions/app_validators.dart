
import 'package:route_smart/core/helper/app_regix.dart';

class AppValidators {
  AppValidators._();

  // ================= Full Name Validator =================
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }
    
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    
    if (value.trim().length > 50) {
      return 'Name must not exceed 50 characters';
    }
    
  
    if (!RegExp(r'^[\p{L}\s]+$', unicode: true).hasMatch(value.trim())) {
      return 'Name can only contain letters and spaces';
    }
    
    return null;
  }

  // ================= Email Validator =================
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    
    if (!AppRegex.isEmailValid(value.trim())) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }


  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (!AppRegex.hasMinLength(value)) {
      return 'Password must be at least 8 characters';
    }
    
    if (!AppRegex.hasUpperCase(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    
    if (!AppRegex.hasLowerCase(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    
    if (!AppRegex.hasNumber(value)) {
      return 'Password must contain at least one number';
    }
    
    if (!AppRegex.hasSpecialCharacter(value)) {
      return 'Password must contain at least one special character';
    }
    
    return null;
  }


  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    
 
    final cleanedPhone = value.replaceAll(RegExp(r'[^\d]'), '');
    
    if (cleanedPhone.length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    
    if (cleanedPhone.length > 15) {
      return 'Phone number must not exceed 15 digits';
    }
    
    return null;
  }

 
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    
    return null;
  }


  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }


  static String? validateMinLength(
    String? value,
    int minLength,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    
    if (value.trim().length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    
    return null;
  }

 
  static String? validateMaxLength(
    String? value,
    int maxLength,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    
    if (value.trim().length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }
    
    return null;
  }

  
  static String? validateNumberOnly(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    
    if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return '$fieldName must contain only numbers';
    }
    
    return null;
  }

  
  static String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'URL is required';
    }
    
    final urlPattern = RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    );
    
    if (!urlPattern.hasMatch(value.trim())) {
      return 'Please enter a valid URL';
    }
    
    return null;
  }
}