import 'package:flutter/material.dart';

const Color kwhite = Colors.white;
const Color kBlack = Colors.black;
const SizedBox kHeight = SizedBox(height: 10);
const SizedBox kHeight20 = SizedBox(height: 20);
const SizedBox kWidth = SizedBox(width: 10);
const SizedBox kWidth20 = SizedBox(width: 20);
const Color appColor = Color(0xFF1B9C8F);
const List<Color> linearGradientColors = [Color(0xFF08AD9D), Color(0xFF1D8076)];

TextStyle textStyleBlack = const TextStyle(color: Colors.black);
TextStyle textStyleWhite = const TextStyle(color: Colors.white);

OutlineInputBorder customOutlineBorder({
  required Color color,
  double width = 2,
  double radius = 12,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: color, width: width),
  );
}
