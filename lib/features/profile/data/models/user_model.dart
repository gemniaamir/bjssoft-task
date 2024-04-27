class UserModel {
  String? _username;
  String? _email;
  String? _gender;
  String? _dob;
  String? _imagePath;
  bool? _isPublic;
  bool? _isDarkTheme;
  bool? _isNotificationOn;
  String? _occupation;

  UserModel();

  get username => _username;

  setUsername(value) => _username = value;

  get email => _email;

  setEmail(value) => _email = value;

  get gender => _gender;

  setGender(value) => _gender = value;

  get dob => _dob;

  setDob(value) => _dob = value;

  get imagePath => _imagePath;

  setImagePath(value) => _imagePath = value;

  get isPublic => _isPublic;

  setIsPublic(value) => _isPublic = value;

  get isDarkTheme => _isDarkTheme;

  setIsDarkTheme(value) => _isDarkTheme = value;

  get isNotificationOn => _isNotificationOn;

  setIsNotificationOn(bool value) => _isNotificationOn = value;

  setOccupation(value) => _occupation = value;

  get occupation => _occupation;
}
