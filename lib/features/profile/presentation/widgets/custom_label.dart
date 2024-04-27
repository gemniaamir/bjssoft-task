import 'package:bjssoft/features/profile/presentation/widgets/medium_title.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title above field
          MediumTitle(title: title),
          const SizedBox(
            height: 5,
          ),
          // Field Value Container
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Flexible(child: MediumTitle(title: value)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
