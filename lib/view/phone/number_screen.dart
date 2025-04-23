import 'package:firebase_sample/widgets/outlined_button_widget.dart';
import 'package:firebase_sample/view/phone/otp_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  // FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CupertinoButton(
                child: Icon(
                  CupertinoIcons.back,
                  color: kBlack,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Text(
              "Sign In",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            kHeight20,
            Text(
              "Enter your phone number to continue",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            kHeight,
            IntlPhoneField(
              initialCountryCode: "IN",
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              // focusNode: focusNode,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))
                  // labelText: "Phone Number",
                  ),
              onChanged: (value) {
                // print(value.completeNumber);
              },
              onCountryChanged: (value) {
                print(value.code);
              },
              languageCode: "en",
            ),
            kHeight,
            Center(
              child: OutlinedButtonWidget(
                onPressed: () {
                  print("pressed");

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return OtpScreen();
                      },
                    ),
                  );
                },
                backgroundColor: const Color(0xED012542),
                child: const Text(
                  "Send OTP",
                  style: TextStyle(
                    color: kwhite,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
