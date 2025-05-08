// File: /Users/hafizbahtiar/Project/alumni_dk/lib/core/helpers/validator.dart

class Validator {
  static String? validateEmail(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Regular expression for validating email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? value, {bool validLength = false}) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // Check if the password length is less than 6 characters
    if (value.length < 6 && validLength == true) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateName(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    // Check if the name length is less than 3 characters
    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    // Check if the confirm password is null or empty
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password is required';
    }

    // Check if the confirm password matches the original password
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
