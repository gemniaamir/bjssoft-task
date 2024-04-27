import 'package:bjssoft/features/profile/presentation/providers/profile_provider.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      this.controller,
      required this.backgroundColor,
      required this.color,
      this.size,
      required this.title,
      required this.action});

  final ProfileProvider? controller;
  final Color backgroundColor;
  final Color color;
  final String title;
  final double? size;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1),
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: TextButton(
              onPressed: () {
                action();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size ?? 16,
                        color: color),
                  ),
                ],
              )),
        ));
  }
}
