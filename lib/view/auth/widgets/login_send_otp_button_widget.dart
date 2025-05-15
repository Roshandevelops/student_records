import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSendOtpButtonWidget extends StatelessWidget {
  const LoginSendOtpButtonWidget(
      {super.key, required this.completePhoneNumber});
  final String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 1 / 4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: const Color(0xFF1B9C8F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () async {
          sendOtpButtonClicked(context);
        },
        child: const Text(
          "Send OTP",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kwhite,
          ),
        ),
      ),
    );
  }

  Future<void> sendOtpButtonClicked(BuildContext context) async {
    if (completePhoneNumber == null || completePhoneNumber!.isEmpty) {
      snackBarWidget(context, "Please Enter a valid phone Number");
      return;
    }
    await Provider.of<AuthenticationProvider>(context, listen: false)
        .phoneNumberActive(context, completePhoneNumber);
  }
}
