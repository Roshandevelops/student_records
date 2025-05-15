import 'package:firebase_sample/view/auth/widgets/login_intl_otp_validating_button_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_intl_resend_otp_button_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_change_phonenumber_button_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_pinput_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_text_widget.dart';
import 'package:flutter/material.dart';


class LoginOtpColumnWidgets extends StatefulWidget {
  const LoginOtpColumnWidgets({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<LoginOtpColumnWidgets> createState() => _LoginOtpColumnWidgetsState();
}

class _LoginOtpColumnWidgetsState extends State<LoginOtpColumnWidgets> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginOtpTextWidget(),
              const LoginOtpChangePhoneNumberButtonWidget(),
              LoginOtpPinputWidget(
                onOtpCompleted: (value) {
                  setState(() {
                    otp = value;
                  });
                },
              ),
              LoginIntlOtpValidatingButtonWidget(
                verificationId: widget.verificationId,
                otp: otp,
              ),
              const LoginIntlResendOtpButtonWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
