// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color borderColor;
  final Function()? onTap;
  final Widget? child;
  final double width;
  final double height;
  final double borderRadius;

  const CustomButton({
    super.key,
    this.title,
    this.textStyle,
    this.bgColor,
    this.textColor,
    this.disabledColor,
    this.disabledTextColor,
    this.borderColor = Colors.transparent,
    required this.onTap,
    this.child,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      color: bgColor,
      disabledColor: disabledColor,
      disabledTextColor: disabledTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: Colors.grey.shade500, width: 1.3),
      ),
      onPressed: onTap,
      child: child ??
          Text(
            title ?? "",
            style: textStyle,
          ),
    );
  }
}
