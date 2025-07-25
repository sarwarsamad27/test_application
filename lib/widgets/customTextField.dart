// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isObSecure;
  final String? hintText;
  final String? errorText;
  final String? labelText;
  final Color? txtColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final IconButton? suffixIcon;
  final int maxLines;
  final double borderRadius;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? height;
  final num heightRatio;
  final double? width;
  final num widthRatio;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final bool autoFocus;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final int? maxLength;
  final EdgeInsetsGeometry? insidePadding;
  final EdgeInsetsGeometry? outsidePadding;
  final VoidCallback? onTap;
  final TapRegionCallback? onTapOutside;

  const CustomTextField({
    super.key,
    this.height,
    this.heightRatio = 0.01,
    this.width,
    this.widthRatio = 0.01,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hintText = "",
    this.errorText,
    this.labelText = "",
    this.floatingLabelBehavior,
    this.txtColor,
    this.isObSecure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.borderRadius = 10.0,
    this.textInputAction = TextInputAction.none,
    this.onChanged,
    this.autoValidateMode,
    this.hintStyle,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.textStyle,
    this.focusNode,
    this.autoFocus = false,
    this.maxLength,
    this.insidePadding,
    this.outsidePadding,
    this.onTap,
    this.onTapOutside,
    bool? readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      onTap: onTap,
      maxLength: maxLength,
      autofocus: autoFocus,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      controller: controller,
      cursorColor: txtColor,
      obscureText: isObSecure,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      maxLines: maxLines,
      style: textStyle,
      decoration: InputDecoration(
        errorText: errorText,
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 15.0,
        ),
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: floatingLabelBehavior,
        alignLabelWithHint: true,
        fillColor: fillColor,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: autoValidateMode,
    );
  }
}
