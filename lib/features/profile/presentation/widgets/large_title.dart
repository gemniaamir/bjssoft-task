import 'package:flutter/material.dart';

class LargeTitle extends StatelessWidget {
  final String title;
  final Color color;

  const LargeTitle({
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
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold, color: color),
    );
  }
}
