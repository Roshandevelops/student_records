import 'dart:developer';

import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/auth/view/phone_screen.dart';
import 'package:firebase_sample/widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPhoneGoogleButtonWidget extends StatelessWidget {
  const LoginPhoneGoogleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButtonWidget(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PhoneScreen()),
            );
          },
          child: const Row(
            children: [
              Icon(Icons.phone, color: Colors.black),
            ],
          ),
        ),
        const SizedBox(width: 16),
        OutlinedButtonWidget(
          onPressed: () {
            Provider.of<AuthenticationProvider>(context, listen: false)
                .googleSignInAccount(context);
            log("Google sign in pressed");
          },
          child: const FaIcon(FontAwesomeIcons.google),
        ),
      ],
    );
  }
}
