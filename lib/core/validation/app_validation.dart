class AppValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if(value == null || value.isEmpty){
      return 'Username required';
    }
    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // if (value.length < 8) {
    //   return 'Password must be at least 8 characters';
    // }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number required';
    }
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return 'Enter a valid 10-digit Indian phone number';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a price';
    }
    if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
      return 'Invalid price format (e.g., 100 or 100.00)';
    }
    return null;
  }

  static String? validateProduct(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter product name';
    }
    return null;
  }

  static String? validateProductPrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the price';
    }
    if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
      return 'Invalid price format (e.g., 100 or 100.00)';
    }
    return null;
  }

  static String? validateProductDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter Product description.';
    }
    return null;
  }
}
