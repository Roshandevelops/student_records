import 'package:firebase_sample/view/auth/view/login_screen.dart';
import 'package:firebase_sample/view/auth/view/phone_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginOtpChangePhoneNumberButtonWidget extends StatelessWidget {
  const LoginOtpChangePhoneNumberButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (ctx) => LoginScreen(),
              ),
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
                        return const PhoneScreen();
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
        kHeight,
      ],
    );
  }
}
