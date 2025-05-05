import 'package:flutter/material.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onDoubleTap,
    this.obscureText = false,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.labelStyle,
    this.labelText,
    this.fillColor,
    this.hintStyle,
    this.color,
    this.onSaved,
    this.validator,
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
  });
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onDoubleTap;
  final bool obscureText;
  final String? labelText;
  final TextStyle? labelStyle;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintStyle;
  final Color? color;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        maxLength: 30,
        obscureText: obscureText,
        style: TextStyle(
          color: color,
        ),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          enabledBorder: enabledBorder,
          disabledBorder: disabledBorder,
          focusedBorder: focusedBorder,
          fillColor: fillColor,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: InkWell(
            onDoubleTap: onDoubleTap,
            child: prefixIcon,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: hintStyle,
        ),
      ),
    );
  }
}
