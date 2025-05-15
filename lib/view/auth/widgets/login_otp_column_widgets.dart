import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/view/auth/view/login_screen.dart';
import 'package:firebase_sample/view/auth/view/phone_screen.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_change_phonenumber_button_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_pinput_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_otp_text_widget.dart';
import 'package:firebase_sample/view/home/home_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

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
              LoginOtpTextWidget(),
              LoginOtpChangePhoneNumberButtonWidget(),
              // LoginOtpPinputWidget(),
              Pinput(
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
              ),
              kHeight20,
              TextButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otp,
                    );

                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    if (context.mounted) {
                      snackBarWidget(context, "Login Successful");
                    }

                    if (context.mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return HomeScreen();
                          },
                        ),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    snackBarWidget(context, e.message ?? "Invalid OTP");
                  } catch (e) {
                    log("OTP verification error: $e");
                    snackBarWidget(
                        context, "An error occurred. Please try again.");
                  }

                  log("test${otp.toString()}");
                },
                child: const Text(
                  "Validate",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF1B9C8F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              kHeight20,
              const SizedBox(
                // color: Colors.amber,
                child: Column(
                  children: [
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
              ),
              const SizedBox(
                // color: Colors.amber,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
