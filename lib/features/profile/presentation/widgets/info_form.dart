import 'package:bjssoft/features/profile/presentation/providers/profile_provider.dart';
import 'package:bjssoft/features/profile/presentation/widgets/action_button.dart';
import 'package:bjssoft/features/profile/presentation/widgets/custom_form_field.dart';
import 'package:bjssoft/utils/constants.dart';
import 'package:flutter/material.dart';

import 'medium_title.dart';

class InfoForm extends StatefulWidget {
  const InfoForm({super.key, required this.controller});

  final ProfileProvider controller;

  @override
  State<InfoForm> createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            // Username
            CustomFormField(
              title: 'Username',
              hintText: 'abc@xyz.com',
              validator: (val) {
                if (val!.length < 3) {
                  return 'Enter valid username, atleast 3 characters long.';
                }
                return null;
              },
            ),
            // Email
            CustomFormField(
              title: 'Email',
              hintText: 'abc@xyz.com',
              validator: (val) {
                if (!Constants.isValidEmail.hasMatch(val!)) {
                  return 'Enter valid email';
                }
                return null;
              },
            ),
            // Occupation
            CustomFormField(
              title: 'Occupation',
              hintText: 'Developer',
              validator: (val) {
                if (val!.length < 3) {
                  return 'Enter valid occupation, atleast 3 characters long.';
                }
                return null;
              },
            ),
            // Gender and DOB
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Gender
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MediumTitle(title: 'Gender'),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          color: Colors.white,
                          child: DropdownMenu<String>(
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            initialSelection: 'Male',
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            menuStyle: MenuStyle(
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 0))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            dropdownMenuEntries: const [
                              DropdownMenuEntry(value: 'Male', label: 'Male'),
                              DropdownMenuEntry(
                                  value: 'Female', label: 'Female')
                            ],
                            onSelected: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  // DOB
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const MediumTitle(title: 'DOB'),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                color: Colors.black45,
                                width: 1,
                              )),
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              widget.controller.selectFromDatePicker(context);
                            },
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 16.0, color: Colors.black45),
                              hintText: 'DOB',
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // Action Buttons
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: ActionButton(
                      backgroundColor: Constants.backgroundColor,
                      color: Colors.blue,
                      title: 'Cancel',
                      size: 20,
                      action: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: ActionButton(
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                      title: 'Save',
                      size: 20,
                      action: () {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
