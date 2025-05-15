import 'dart:developer';

import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class LoginOtpPinputWidget extends StatefulWidget {
  const LoginOtpPinputWidget({super.key, required this.onOtpCompleted});
  final Function(String) onOtpCompleted;

  @override
  State<LoginOtpPinputWidget> createState() => _LoginOtpPinputWidgetState();
}

class _LoginOtpPinputWidgetState extends State<LoginOtpPinputWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight20,
        Pinput(
          length: 6,
          onCompleted: (value) {
            widget.onOtpCompleted(value);
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          showCursor: true,
        ),
      ],
    );
  }
}
