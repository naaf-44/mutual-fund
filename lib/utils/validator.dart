/// all the validation can be added here
class Validator {

  /// email validation
  static String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// password validation
  static String? validatePassword(String? value) {
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (!passwordRegex.hasMatch(value)) {
      return 'Please enter the valid password';
    }
    return null;
  }
}