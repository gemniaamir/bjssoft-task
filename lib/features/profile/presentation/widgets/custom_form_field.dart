import 'package:bjssoft/features/profile/presentation/widgets/medium_title.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  final String title;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumTitle(title: title),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: validator,
            autofocus: false,
            style: const TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black26),
              contentPadding: const EdgeInsets.all(15),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(7),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
