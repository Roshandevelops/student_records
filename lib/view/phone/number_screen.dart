import 'package:firebase_sample/widgets/outlined_button_widget.dart';
import 'package:firebase_sample/view/phone/otp_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(
                  CupertinoIcons.back,
                  color: kBlack,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            // Welcome Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "We’re happy to see you again.\nLogin quickly with your phone number to continue.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // Sign In header with gradient
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 100,
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1D8076),
                      offset: Offset(0, 5),
                      blurRadius: 1,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF08AD9D),
                      Color(0xFF1D8076),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topLeft,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Enter your phone number to continue",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Phone number input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IntlPhoneField(
                initialCountryCode: "IN",
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: 'Phone Number',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                ),
                onChanged: (value) {
                  // Handle number change
                },
                onCountryChanged: (value) {
                  print(value.code);
                },
                languageCode: "en",
              ),
            ),

            const SizedBox(height: 40),

            // Send OTP button
            Center(
              child: OutlinedButtonWidget(
                borderColor: Colors.transparent,
                backgroundColor: const Color(0xFF1B9C8F),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const OtpScreen(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  child: Text(
                    "Send OTP",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
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
