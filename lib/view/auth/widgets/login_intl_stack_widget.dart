import 'package:firebase_sample/view/auth/widgets/login_intl_stack_waveclipper.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            width: double.infinity,
            height: size.height * 0.35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: linearGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 60,
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
