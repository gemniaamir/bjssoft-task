import 'package:flutter/material.dart';

class MediumTitle extends StatelessWidget {
  final String title;
  final Color color;

  const MediumTitle({
    Key? key,
    required this.title,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold, color: color),
    );
  }
}
