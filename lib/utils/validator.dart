class Validator {
  static String? isValidEmail(String? email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email ?? '')) {
      return 'Invalid email';
    }
    return null;
  }

  static String? isValidPhoneNumber(String? phoneNumber) {
    final RegExp phoneRegex = RegExp(
      r'^\d+$',
    );
    if ((phoneNumber ?? '').length != 10 ||
        !phoneRegex.hasMatch(phoneNumber ?? '')) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    if (!passwordRegex.hasMatch(password ?? '')) {
      return 'Password must contain at least 8 characters with at least one letter and one number';
    }
    return null;
  }

  static String? isMatching(String? value, String? match) {
    if (value != match) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? isNotEmpty(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    }
    return null;
  }
}
