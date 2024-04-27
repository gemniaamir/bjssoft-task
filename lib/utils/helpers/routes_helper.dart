import 'package:bjssoft/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:bjssoft/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

final appRoutes = <String, WidgetBuilder> {
  '/': (context) => const ProfileScreen(),
  Constants.profileEditScreen : (context) => EditProfileScreen(),
};
