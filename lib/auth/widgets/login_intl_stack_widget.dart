import 'package:firebase_sample/auth/view/login_screen.dart';
import 'package:firebase_sample/auth/widgets/login_intl_stack_waveclipper.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginIntlStackWidget extends StatelessWidget {
  const LoginIntlStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            width: double.infinity,
            height: size * 1 / 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: linearGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 0,
            bottom: 0,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const LoginScreen();
                  },
                ),
                (route) {
                  return false;
                },
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kwhite,
            ),
          ),
        ),
        const Positioned(
          top: 100,
          left: 24,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: kwhite,
                ),
              ),
              kHeight,
              Text(
                "Login quickly with your phone number to continue.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kwhite,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
