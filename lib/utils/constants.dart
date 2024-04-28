import 'dart:ui';

class Constants {
  // Route Names
  static const String homeScreen = '/';
  static const String profileEditScreen = '/edit';

  // Assets constants
  static const String userPlaceholder = 'assets/images/user.png';

  // Tags & Keys
  static const String avatarKey = 'avatar-tag';
  static const String userModelKey = 'saved-user-model';

  // Colors
  static const Color backgroundColor = Color.fromARGB(255, 220, 220, 220);

  // Regex
  static RegExp isValidEmail =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Messages
  static const String emptyFieldErrorMessage = 'Please provide all fields';

}
