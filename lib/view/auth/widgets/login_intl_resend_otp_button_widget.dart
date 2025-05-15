import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginIntlResendOtpButtonWidget extends StatelessWidget {
  const LoginIntlResendOtpButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [
          kHeight,
          Text(
            "Didn't get the code ?",
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Resent code",
            style: TextStyle(
              color: Color(0xFF1B9C8F),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
