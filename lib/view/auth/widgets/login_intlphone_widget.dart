import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/view/auth/view/otp_screen.dart';
import 'package:firebase_sample/view/auth/widgets/login_intlphone_textfield_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class IntlphoneWidget extends StatefulWidget {
  const IntlphoneWidget({super.key});

  @override
  State<IntlphoneWidget> createState() => _IntlphoneWidgetState();
}

class _IntlphoneWidgetState extends State<IntlphoneWidget> {
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            LoginIntlphoneTextfieldWidget(
              onPhoneNumberChanged: (value) {
                setState(() {
                  completePhoneNumber = value;
                });
              },
            ),
            // IntlPhoneField(
            //   initialCountryCode: "IN",
            //   inputFormatters: [
            //     FilteringTextInputFormatter.digitsOnly,
            //   ],
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: kwhite,
            //     hintText: 'Phone Number',
            //     hintStyle: const TextStyle(color: Colors.grey),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(14),
            //       borderSide: BorderSide.none,
            //     ),
            //     contentPadding:
            //         const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            //   ),
            //   onChanged: (value) {
            //     setState(() {
            //       completePhoneNumber = value.completeNumber;
            //       log(" vasu Phone number: $completePhoneNumber");
            //     });
            //   },

            //   languageCode: "en",
            // ),

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
                  if(completePhoneNumber==null||completePhoneNumber!.isEmpty){
                    snackBarWidget(context, "Please Enter a valid phone Number");
                       return;
                  }
               
                  Provider.of<AuthenticationProvider>(context,listen: false).otpLogin(context, completePhoneNumber);
                  
                  
                  
                  // await Provider.of<AuthenticationProvider>(context,
                  //         listen: false)
                  //     .otpLogin(context, completePhoneNumber);
                  // try {
                  //   await FirebaseAuth.instance.verifyPhoneNumber(
                  //       verificationCompleted:
                  //           (PhoneAuthCredential credential) {},
                  //       verificationFailed: (FirebaseAuthException exception) {
                  //         log("checking ${exception.message!}");
                  //       },
                  //       codeSent: (String verificationId, int? resendToken) {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //             builder: (ctx) => OtpScreen(
                  //               verificationId: verificationId,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       codeAutoRetrievalTimeout: (String verificationId) {},
                  //       phoneNumber: completePhoneNumber,
                  //       );

                  //   log("hello${completePhoneNumber.toString()}");
                  // } catch (e) {
                  //   log(e.toString());
                  // }
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
