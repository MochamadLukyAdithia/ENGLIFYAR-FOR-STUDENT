import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;
  final String icon;
  final VoidCallback pressed;
  const MyButton(
      {super.key,
      required this.icon,
      required this.pressed,
      this.color,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: pressed,
      style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor:
              backgroundColor ?? Colors.white,
          fixedSize: const Size(50, 50)),
      tooltip: 'Click me',
      icon: SvgPicture.string(
        icon,
        color: color,
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
    );
  }
}
