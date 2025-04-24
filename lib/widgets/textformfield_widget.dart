import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.suffixIcon,
      this.prefixIcon,
      this.onDoubleTap,
      this.obscureText = false});
  final String hintText;
  final TextEditingController textEditingController;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onDoubleTap;
  final bool obscureText;
  // final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return
        // color: const Color(0xFF1B9C8F),
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        maxLength: 30,
        obscureText: obscureText,
        style: const TextStyle(
          color: kBlack,
        ),
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor: kwhite,
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
          hintStyle: const TextStyle(
            color: Color(0xFF1B9C8F),
          ),
        ),
      ),
    );
  }
}
