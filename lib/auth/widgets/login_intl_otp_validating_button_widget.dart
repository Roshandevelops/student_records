import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginIntlOtpValidatingButtonWidget extends StatelessWidget {
  const LoginIntlOtpValidatingButtonWidget({
    super.key,
    required this.verificationId,
    required this.otp,
  });

  final String otp;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await validateOtp(context);
      },
      child: const Text(
        "Validate",
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFF1B9C8F),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Future<void> validateOtp(BuildContext context) async {
    await Provider.of<AuthenticationProvider>(context, listen: false)
        .pinPutLogin(context, verificationId, otp);
  }
}
