import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/widgets/material_button_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class LoginForgotPasswordWidget extends StatelessWidget {
  const LoginForgotPasswordWidget({
    super.key,
    required this.forgotFormKey,
    required this.forgotEmailController,
  });

  final GlobalKey<FormState> forgotFormKey;
  final TextEditingController forgotEmailController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: forgotFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                kHeight20,
                const Text(
                  "Enter your registered email below. We'll send \nyou a link to reset your password.",
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                TextformfieldWidget(
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return emailErrorDialogue;
                    } else {
                      return null;
                    }
                  },
                  fillColor: kwhite,
                  controller: forgotEmailController,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.teal,
                  ),
                  hintText: "Email",
                ),
                const SizedBox(height: 30),
                MaterialButtonWidget(
                  buttonTextColor: appColor,
                  materialButtonColor: kwhite,
                  onPressed: () async {
                    if (forgotFormKey.currentState!.validate()) {
                      forgotFormKey.currentState!.save();
                      resetPassword(context);
                    }
                  },
                  formKey: forgotFormKey,
                  emailController: forgotEmailController,
                  buttonText: "Reset Password",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      final forgotEmail = forgotEmailController.text.trim();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: forgotEmail);

      if (context.mounted) {
        snackBarWidget(context, "Password Reset Email Sent");
      }
      forgotEmailController.clear();

      if (context.mounted) {
        Navigator.of(context).popUntil(
          (route) => route.isFirst,
        );
      }
    } on FirebaseException catch (e) {
      e.message;
    } on SocketException catch (_) {
      return "Please check your Internet connection try again later";
    } catch (e) {
      return e.toString();
    }
  }
}
