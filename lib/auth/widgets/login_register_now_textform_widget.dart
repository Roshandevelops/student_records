import 'dart:developer';
import 'package:firebase_sample/auth/widgets/login_register_now_button_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class LoginRegisterNowTextformWidget extends StatefulWidget {
  const LoginRegisterNowTextformWidget({
    super.key,
    required this.registerEmailController,
    required this.registerPassController,
    required this.confirmRegisterPassController,
    required this.formKey,
    // required this.validator,
  });

  final TextEditingController registerEmailController;

  final TextEditingController registerPassController;

  final TextEditingController confirmRegisterPassController;
  final GlobalKey<FormState> formKey;

  // final String? Function(String?)? validator;
  @override
  State<LoginRegisterNowTextformWidget> createState() =>
      _LoginRegisterNowTextformWidgetState();
}

class _LoginRegisterNowTextformWidgetState
    extends State<LoginRegisterNowTextformWidget> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextformfieldWidget(
            fillColor: appColor,
            hintStyle:const TextStyle(color: kwhite),
            contentStyle:const TextStyle(color: kwhite),
            validator: (value) {
              if (value!.isEmpty || !value.contains("@gmail.com")) {
                return emailErrorDialogue;
              } else {
                return null;
              }
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            // fillColor: kwhite,
            controller: widget.registerEmailController,
            prefixIcon: const Icon(
              Icons.email_outlined,
              // color: Colors.teal,
            ),
            hintText: "Email",
          ),
          const SizedBox(height: 15),
          TextformfieldWidget(
            fillColor: appColor,
            hintStyle:const TextStyle(color: kwhite),
            contentStyle:const TextStyle(color: kwhite),
            // validator: widget.validator,
            validator: (value) {
              if (value!.length < 6) {
                return passwordDialogue;
              } else {
                return null;
              }
            },
            obscureText: !isPasswordVisible,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            // fillColor: kwhite,
            controller: widget.registerPassController,

            onDoubleTap: () {
              log("eye pressed");
            },
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              child: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
            ),
            prefixIcon: const Icon(
              Icons.lock_outline,
            ),
            hintText: "Password",
          ),
          const SizedBox(height: 15),
          TextformfieldWidget(
            fillColor: appColor,
            hintStyle: const TextStyle(color: kwhite),
            contentStyle: const TextStyle(color: kwhite),
            // validator: widget.validator,
            validator: (value) {
              if (value!.length < 6) {
                return passwordDialogue;
              } else {
                return null;
              }
            },
            obscureText: !isConfirmPasswordVisible,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            // fillColor: kwhite,
            controller: widget.confirmRegisterPassController,

            onDoubleTap: () {
              log("eye pressed");
            },
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                });
              },
              child: Icon(
                isConfirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.white70,
              ),
            ),
            prefixIcon: const Icon(
              Icons.lock_outline,
            ),
            hintText: "Confirm Password",
          ),
          const SizedBox(height: 30),
          LoginRegisterNowButtonWidget(
            formKey: widget.formKey,
            confirmRegisterPassController: widget.confirmRegisterPassController,
            registerEmailController: widget.registerEmailController,
            registerPassController: widget.registerPassController,
          )
        ],
      ),
    );
  }
}
