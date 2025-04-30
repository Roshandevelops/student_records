import 'package:firebase_sample/view/auth/view/login_screen.dart';
import 'package:firebase_sample/view/auth/view/number_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Verification",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      kHeight,
                      Text(
                        "We have sent the code verification to",
                      ),
                      // kHeight,
                      Text(
                        "+91******0451",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (ctx) => LoginWidget(),
                            ),
                            // ModalRoute.withName("homescreen"),
                            (route) {
                              return false;
                            },
                          );
                          Future.delayed(
                            Duration.zero,
                            () {
                              if (context.mounted) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return const NumberScreen();
                                    },
                                  ),
                                );
                              }
                            },
                          );
                        },
                        child: const Text(
                          "Change phone number ?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B9C8F),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight20,
                kHeight20,
                SizedBox(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      OtpTextField(
                        decoration: const InputDecoration(hintText: "0"),
                        onCodeChanged: (value) {
                          // if (value.length == 1) {
                          //   FocusScope.of(context).nextFocus();
                          // }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          // LengthLimitingTextInputFormatter(1)
                        ],
                        fieldWidth: 50,
                        fieldHeight: 50,
                        numberOfFields: 4,
                        borderColor: const Color(0xFF512DA8),
                        showFieldAsBox: true,
                        keyboardType: TextInputType.number,
                      ),
                      kHeight,
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Validate",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1B9C8F),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
        ),
      ),
    );
  }
}
