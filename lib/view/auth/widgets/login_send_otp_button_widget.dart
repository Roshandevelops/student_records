import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/material_button_widget.dart';
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
    return MaterialButtonWidget(
      buttonWidth: screenWidth * 1 / 3,
      buttonText: "Send",
      onPressed: () {
        sendOtpButtonClicked(context);
      },
      buttonTextColor: kwhite,
      materialButtonColor: appColor,
    );
  }

  Future<void> sendOtpButtonClicked(BuildContext context) async {
    if (completePhoneNumber == null || completePhoneNumber!.isEmpty) {
      snackBarWidget(context, "Please enter a valid phone number");
      return;
    } else {
      await Provider.of<AuthenticationProvider>(context, listen: false)
          .verifyNumber(context, completePhoneNumber);
    }
  }
}
