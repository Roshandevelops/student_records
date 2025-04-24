import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget(
      {super.key, this.onPressed, this.child, this.backgroundColor});

  final void Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;

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
          side: const BorderSide(
            color: kwhite,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
