import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isColorChoose,
    required this.color,
  });

  final bool isColorChoose;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isColorChoose
        ? CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 36,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 40,
            backgroundColor: color,
          );
  }
}
