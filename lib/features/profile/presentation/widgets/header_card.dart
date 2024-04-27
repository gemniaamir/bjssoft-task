import 'package:bjssoft/features/profile/presentation/providers/profile_provider.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import 'action_button.dart';
import 'large_title.dart';
import 'medium_title.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard(
      {super.key, required this.controller, required this.isEditVisible});

  final ProfileProvider controller;
  final bool isEditVisible;

  @override
  Widget build(BuildContext context) {
    double size = calculateImageSize(isEditVisible, context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 2,
          child: controller.userModel.imagePath == null
              ? Hero(
                  tag: Constants.avatarKey,
                  child: Image.asset(
                    Constants.userPlaceholder,
                    width: size,
                    height: size,
                  ))
              : Hero(
                  tag: Constants.avatarKey,
                  child: Image.file(
                    controller.userModel.imagePath,
                    width: size,
                    height: size,
                  ),
                ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username
              LargeTitle(
                title: controller.userModel.username ?? '-',
              ),
              // Occupation
              MediumTitle(title: controller.userModel.occupation ?? '-'),
              const SizedBox(
                height: 15,
              ),
              // Edit Button
              !isEditVisible
                  ? const SizedBox.shrink()
                  : Container(
                      margin: const EdgeInsets.only(right: 40),
                      child: ActionButton(
                        controller: controller,
                        title: 'Edit Profile',
                        backgroundColor: Colors.blue,
                        color: Colors.white,
                        action: () {
                          Navigator.pushNamed(
                              context, Constants.profileEditScreen);
                        },
                      ),
                    )
            ],
          ),
        ),
      ],
    );
  }

  double calculateImageSize(bool isEditVisible, BuildContext context) {
    return isEditVisible
        ? MediaQuery.of(context).size.width / 2
        : MediaQuery.of(context).size.width / 3;
  }
}
