// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:bjssoft/features/profile/presentation/providers/profile_provider.dart';
import 'package:flutter/material.dart';

import 'package:bjssoft/features/profile/presentation/widgets/medium_title.dart';

class CustomSwitchField extends StatelessWidget {
  final String title;
  String? value;
  final bool switchState;
  final Function updateState;
  final ProfileProvider controller;

  CustomSwitchField(
      {Key? key,
      required this.title,
      this.value,
      required this.switchState,
      required this.updateState,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Colors.white),
      margin: const EdgeInsets.all(19),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          MediumTitle(
            title: title,
            color: Colors.black87,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Selected Value
              MediumTitle(
                title: value ?? '',
                color: Colors.black54,
              ),
              const SizedBox(
                width: 10,
              ),
              // Selected Switch State
              Switch(
                  value: switchState,
                  onChanged: (updatedState) {
                    controller.updateUserSwitchValues(
                        updateState, updatedState);
                  })
            ],
          )
        ],
      ),
    );
  }
}
