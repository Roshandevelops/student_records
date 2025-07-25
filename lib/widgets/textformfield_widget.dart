import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget(
      {super.key,
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
      this.keyboardType,
      this.padding = const EdgeInsets.symmetric(horizontal: 15),
      this.inputFormatters,
      this.error,
      this.errorStyle,
      this.contentStyle,
      this.onChanged});
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
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? error;
  final TextStyle? errorStyle;
  final void Function(String)? onChanged;
  final TextStyle? contentStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: TextFormField(
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
        // maxLength: 30,
        obscureText: obscureText,
        style: contentStyle,
        controller: controller,
        decoration: InputDecoration(
          error: error,
          errorStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: kwhite,
          ),
          // enabledBorder: customOutlineBorder(color: Colors.white60, width: 2),
          // focusedBorder: customOutlineBorder(color: kwhite, width: 2),
          enabledBorder: enabledBorder,
          disabledBorder: disabledBorder,
          focusedBorder: focusedBorder,
          fillColor: fillColor,
          // appColor,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: kwhite,
          suffixIconColor: kwhite,

          // InkWell(
          //   onDoubleTap: onDoubleTap,
          //   child: prefixIcon,
          // ),
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
