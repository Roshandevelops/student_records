import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/view/auth/view/otp_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class IntphoneFieldWidget extends StatefulWidget {
  const IntphoneFieldWidget({super.key});

  @override
  State<IntphoneFieldWidget> createState() => _IntphoneFieldWidgetState();
}

class _IntphoneFieldWidgetState extends State<IntphoneFieldWidget> {
  String completePhoneNumber="";


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            IntlPhoneField(

              initialCountryCode: "IN",
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                filled: true,
                fillColor: kwhite,
                hintText: 'Phone Number',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              ),
              onChanged: (value) {
                setState(() {
                   completePhoneNumber= value.completeNumber;
                    log(" vasu Phone number: $completePhoneNumber");
                  
                });
              
              },
              // onCountryChanged: (value) {
              //   log(value.code);
              // },
              languageCode: "en",
            ),

            const SizedBox(height: 40),

            // Send OTP Button
            SizedBox(
              width: double.infinity,
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
                  try {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException exception) {
                        log("checking ${exception.message!}");
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => OtpScreen(
                              verificationId: verificationId,
                            ),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber:
                      completePhoneNumber
                
                    );

                    log("hello${completePhoneNumber.toString()}");
                  } catch (e) {
                    log(e.toString());
            
                  }
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
            ),
          ],
        ),
      ),
    );
  }
}
