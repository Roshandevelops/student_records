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
                // kHeight20,
                // Pinput(
                //   length: 6,
                //   onCompleted: (value) {
                //     setState(
                //       () {
                //         otp = value;
                //         log("OTP Entered: $otp");
                //       },
                //     );
                //   },
                //   inputFormatters: [
                //     FilteringTextInputFormatter.digitsOnly,
                //   ],
                //   keyboardType: TextInputType.number,
                //   showCursor: true,
                // ),
                // kHeight,
                // TextButton(
                //   onPressed: () async {
                //     try {
                //       PhoneAuthCredential credential =
                //           PhoneAuthProvider.credential(
                //         verificationId: widget.verificationId,
                //         smsCode: otp,
                //       );

                //       await FirebaseAuth.instance
                //           .signInWithCredential(credential);
                //       if (context.mounted) {
                //         snackBarWidget(context, "Login Successful");
                //       }

                //       if (context.mounted) {
                //         Navigator.of(context).pushReplacement(
                //           MaterialPageRoute(
                //             builder: (ctx) {
                //               return HomeScreen();
                //             },
                //           ),
                //         );
                //       }
                //     } on FirebaseAuthException catch (e) {
                //       snackBarWidget(context, e.message ?? "Invalid OTP");
                //     } catch (e) {
                //       log("OTP verification error: $e");
                //       snackBarWidget(
                //           context, "An error occurred. Please try again.");
                //     }

                //     // try {
                //     //   PhoneAuthCredential credential =
                //     //       PhoneAuthProvider.credential(
                //     //     verificationId: widget.verificationId,
                //     //     smsCode: otp,
                //     //   );

                //     //   FirebaseAuth.instance
                //     //       .signInWithCredential(credential)
                //     //       .then(
                //     //     (value) {

                //     //       snackBarWidget(context, "Login Successfull");
                //     //       Navigator.of(context).pushReplacement(
                //     //         MaterialPageRoute(
                //     //           builder: (context) {
                //     //             return HomeScreen();
                //     //           },
                //     //         ),
                //     //       );
                //     //     },
                //     //   );
                //     // } catch (e) {
                //     //   log(e.toString());
                //     // }

                //     log("test${otp.toString()}");
                //   },
                //   child: const Text(
                //     "Validate",
                //     style: TextStyle(
                //       fontSize: 18,
                //       color: Color(0xFF1B9C8F),
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   // color: Colors.amber,
                //   child: Column(
                //     children: [
                //       Text(
                //         "Didn't get the code ?",
                //         style: TextStyle(
                //           color: Colors.red,
                //           fontSize: 15,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //       Text(
                //         "Resent code",
                //         style: TextStyle(
                //           color: Color(0xFF1B9C8F),
                //           fontSize: 15,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   // color: Colors.amber,
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 40,
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
