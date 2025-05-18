import 'dart:developer';
import 'package:firebase_sample/view/auth/widgets/login_register_now_button_widget.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class LoginRegisterNowTextformWidget extends StatelessWidget {
  const LoginRegisterNowTextformWidget(
      {super.key,
      required this.registerEmailController,
      required this.registerPassController,
      required this.confirmRegisterPassController});

  final TextEditingController registerEmailController;

  final TextEditingController registerPassController;

  final TextEditingController confirmRegisterPassController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextformfieldWidget(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          // fillColor: kwhite,
          controller: registerEmailController,
          prefixIcon: const Icon(
            Icons.email_outlined,
            // color: Colors.teal,
          ),
          hintText: "Email",
        ),
        const SizedBox(height: 15),
        TextformfieldWidget(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          // fillColor: kwhite,
          controller: registerPassController,
          obscureText: true,
          onDoubleTap: () {
            log("eye pressed");
          },
          suffixIcon: const Icon(
            Icons.remove_red_eye_outlined,
          ),
          prefixIcon: const Icon(
            Icons.lock_outline,
          ),
          hintText: "Password",
        ),
        const SizedBox(height: 15),
        TextformfieldWidget(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          // fillColor: kwhite,
          controller: confirmRegisterPassController,
          obscureText: true,
          onDoubleTap: () {
            log("eye pressed");
          },
          suffixIcon: const Icon(
            Icons.remove_red_eye_outlined,
          ),
          prefixIcon: const Icon(
            Icons.lock_outline,
          ),
          hintText: "Confirm Password",
        ),
        const SizedBox(height: 30),
        LoginRegisterNowButtonWidget(
          confirmRegisterPassController: confirmRegisterPassController,
          registerEmailController: registerEmailController,
          registerPassController: registerPassController,
        )
      ],
    );
  }
}
