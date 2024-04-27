import 'dart:developer';

import 'package:bjssoft/features/profile/data/models/user_model.dart';
import 'package:bjssoft/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  // Text Editing Controllers for TextFields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  // User Info Model
  final UserModel _userModal = UserModel();

  UserModel get userModel => _userModal;

  void updateUserModel(Function updateValue, String value) {
    updateValue(value);
    notifyListeners();
  }

  // Navigation Method
  void gotoEditProfile(BuildContext context) {
    Navigator.pushNamed(context, Constants.profileEditScreen);
  }

  String _dob = '';
  String get dob => _dob;

  void updateDob(String dob) {
    _dob = dob;

    notifyListeners();
  }

  String _gender = '';
  String get gender => _gender;

  void updateGender(String gender) {
    _gender = gender;

    notifyListeners();
  }

  void loadDataFromPrefs() {}

  void saveDataToPrefs() {}

  void selectFromDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
        helpText: 'Please select DOB',
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      String date = pickedDate.toString().split('').first.toString();

      updateDob(date);
    } else {
      log("No date selected");
    }
  }
}
