import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({super.key, this.onPressed, this.child});

  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side:const BorderSide(
            color: kBlack,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
