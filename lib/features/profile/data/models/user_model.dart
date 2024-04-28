// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  UserModel.withValues(
      this._username,
      this._email,
      this._gender,
      this._dob,
      this._imagePath,
      this._isPublic,
      this._isDarkTheme,
      this._isNotificationOn,
      this._occupation);

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

  Map<String, dynamic> toJson() => {
        '_username': _username ?? '',
        '_email': _email ?? '',
        '_gender': _gender ?? '',
        '_dob': _dob ?? '',
        '_imagePath': _imagePath ?? '',
        '_isPublic': _isPublic ?? false,
        '_isDarkTheme': _isDarkTheme ?? false,
        '_isNotificationOn': _isNotificationOn ?? false,
        '_occupation': _occupation ?? '',
      };

  UserModel.fromJson(Map<String, dynamic> json)
      : _username = json['_username'] ?? '',
        _email = json['_email'] ?? '',
        _gender = json['_gender'] ?? '',
        _dob = json['_dob'] ?? '',
        _imagePath = json['_imagePath'] ?? '',
        _isPublic = json['_isPublic'] ?? false,
        _isDarkTheme = json['_isDarkTheme'] ?? false,
        _isNotificationOn = json['_isNotificationOn'] ?? false,
        _occupation = json['_occupation'] ?? '';
}
