import 'package:bjssoft/features/profile/presentation/providers/profile_provider.dart';
import 'package:bjssoft/features/profile/presentation/widgets/custom_label.dart';
import 'package:bjssoft/features/profile/presentation/widgets/custom_switch_field.dart';
import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key, required this.controller});

  final ProfileProvider controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email
        CustomLabel(title: 'Email', value: controller.userModel.email ?? '-'),
        // Gender and DOB
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Gender
            Flexible(
                child: CustomLabel(
              title: 'Gender',
              value: controller.userModel.gender ?? '-',
            )),
            // DOB
            Flexible(
                child: CustomLabel(
              title: 'DOB',
              value: controller.userModel.dob ?? '-',
            ))
          ],
        ),
        // Account Visibility Switch
        CustomSwitchField(
            title: 'Account',
            value: controller.userModel.isPublic == null
                ? 'Private'
                : controller.userModel.isPublic
                    ? 'Public'
                    : 'Private',
            switchState: controller.userModel.isPublic ?? false,
            updateState: controller.userModel.setIsPublic),
        // Account Visibility Switch
        CustomSwitchField(
            title: 'Notification',
            switchState: controller.userModel.isNotificationOn ?? false,
            updateState: controller.userModel.setIsNotificationOn),
        CustomSwitchField(
            title: 'Theme',
            value: controller.userModel.isDarkTheme == null
                ? 'Dark Theme'
                : controller.userModel.isDarkTheme
                    ? 'Dark Theme'
                    : 'Light Theme',
            switchState: controller.userModel.isDarkTheme ?? false,
            updateState: controller.userModel.setIsDarkTheme),
      ],
    );
  }
}
