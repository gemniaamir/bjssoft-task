import 'dart:io';

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
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              child: isEditVisible
                  ? controller.imagePath == null ||
                          controller.imagePath!.isEmpty
                      ? Hero(
                          tag: Constants.avatarKey,
                          child: Image.asset(
                            Constants.userPlaceholder,
                            width: size,
                            height: size,
                            fit: BoxFit.cover,
                          ))
                      : Hero(
                          tag: Constants.avatarKey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(size),
                            child: Image.file(
                              File(controller.imagePath!),
                              width: size,
                              height: size,
                              fit: BoxFit.cover,
                            ),
                          ))
                  : (controller.userModel.imagePath == null ||
                          controller.userModel.imagePath == '')
                      ? Hero(
                          tag: Constants.avatarKey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(size),
                            child: Image.asset(
                              Constants.userPlaceholder,
                              width: size,
                              height: size,
                              fit: BoxFit.cover,
                            ),
                          ))
                      : Hero(
                          tag: Constants.avatarKey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(size),
                            child: Image.file(
                              File(controller.userModel.imagePath),
                              width: size,
                              fit: BoxFit.cover,
                              height: size,
                            ),
                          ),
                        ),
            ),
            isEditVisible
                ? Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      padding: const EdgeInsets.all(4),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () {
                          controller.selectProfileImage();
                        },
                      ),
                    ))
                : const SizedBox.shrink(),
          ],
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
              isEditVisible
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
