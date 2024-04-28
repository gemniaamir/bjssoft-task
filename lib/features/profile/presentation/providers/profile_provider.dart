import 'dart:convert';
import 'dart:developer';

import 'package:bjssoft/features/profile/data/models/user_model.dart';
import 'package:bjssoft/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {
    if (kDebugMode) {
      print('Profile provider initialized.......');
    }

    loadPrefs();
  }

  void loadPrefs() async {
    await loadDataFromPrefs();
  }

  // Text Editing Controllers for TextFields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  // User Info Model
  UserModel _userModal = UserModel();

  UserModel get userModel => _userModal;

  void updateUserSwitchValues(Function update, bool value) {
    update(value);
    saveDataToPrefs();

    notifyListeners();
  }

  void updateUserModel(BuildContext context) async {
    UserModel model = UserModel.withValues(
        usernameController.text,
        emailController.text,
        gender,
        dobController.text,
        imagePath,
        userModel.isPublic,
        userModel.isDarkTheme,
        userModel.isNotificationOn,
        occupationController.text);

    _userModal = model;

    // Save changes to Prefs as user modal gets updated
    await saveDataToPrefs();

    notifyListeners();

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  // Navigation Method
  void gotoEditProfile(BuildContext context) {
    Navigator.pushNamed(context, Constants.profileEditScreen);
  }

  // Save data to prefs
  Future<void> saveDataToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.userModelKey, json.encode(userModel));
  }

  // Read data from Shared Prefs
  Future<void> loadDataFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(Constants.userModelKey)) {
      _userModal = UserModel.fromJson(
          await jsonDecode(prefs.getString(Constants.userModelKey)!));

      // Load data for edit form fields
      dobController.text = userModel.dob;
      emailController.text = userModel.email;
      usernameController.text = userModel.username;
      occupationController.text = userModel.occupation;
      _gender = userModel.gender;
      _imagePath = userModel.imagePath;

      if (kDebugMode) {
        print('Data loaded from memory');
      }

      notifyListeners();
    }
  }

  ///
  /// Form items current state

  String _gender = '';
  String get gender => _gender;

  void updateGender(String gender) {
    _gender = gender;

    notifyListeners();
  }

  String _imagePath = '';
  String? get imagePath => _imagePath;

  void updateImagePath(String image) {
    _imagePath = image;

    notifyListeners();
  }

  void selectProfileImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    updateImagePath(image!.path);

    notifyListeners();
  }

  void selectFromDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
        helpText: 'Please select DOB',
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      String date = pickedDate.toString().split(' ').first.toString();
      dobController.text = date;
    } else {
      log("No date selected");
    }
  }

  void showSnackBar(String title, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
      duration: const Duration(seconds: 1),
    ));
  }
}
