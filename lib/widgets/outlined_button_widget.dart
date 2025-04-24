import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget(
      {super.key,
      this.onPressed,
      this.child,
      this.backgroundColor,
      this.borderColor = const Color(0xFF000000)});

  final void Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
