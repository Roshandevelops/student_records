import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/view/auth/view/login_screen.dart';
import 'package:firebase_sample/view/auth/view/phone_screen.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_change_phonenumber_button_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_column_widgets.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_text_widget.dart';
import 'package:firebase_sample/view/home/home_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.verificationId,
  });

  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoginOtpColumnWidgets(
                        verificationId: widget.verificationId,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
