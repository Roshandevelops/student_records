import 'package:flutter/material.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget(
      {super.key,
      this.hintText,
      this.textEditingController,
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
      this.padding = const EdgeInsets.symmetric(horizontal: 15)});
  final String? hintText;
  final TextEditingController? textEditingController;
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

  // final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return
        // color: const Color(0xFF1B9C8F),
        Padding(
      padding: padding!,
      child: TextFormField(
        maxLength: 30,
        obscureText: obscureText,
        style: TextStyle(
          color: color,
        ),
        controller: textEditingController,
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
          //const TextStyle(
          //   color: Color(0xFF1B9C8F),
          // ),
        ),
      ),
    );
  }
}
