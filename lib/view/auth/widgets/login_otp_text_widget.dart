import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginOtpTextWidget extends StatelessWidget {
  const LoginOtpTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Verification",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        kHeight,
        Text(
          "We have sent the code verification to",
        ),
        // kHeight,
        Text(
          "+91******0451",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
