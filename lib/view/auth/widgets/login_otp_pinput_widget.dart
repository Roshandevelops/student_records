import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class LoginOtpPinputWidget extends StatefulWidget {
  const LoginOtpPinputWidget({super.key});

  @override
  State<LoginOtpPinputWidget> createState() => _LoginOtpPinputWidgetState();
}

class _LoginOtpPinputWidgetState extends State<LoginOtpPinputWidget> {
  String otp = "";
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      onCompleted: (value) {
        setState(
          () {
            otp = value;
            log("OTP Entered: $otp");
          },
        );
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      showCursor: true,
    );
  }
}
