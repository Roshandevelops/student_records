import 'package:firebase_sample/auth/widgets/login_heading_widget.dart';
import 'package:firebase_sample/auth/widgets/login_container_widget.dart';
import 'package:firebase_sample/auth/widgets/login_phone_google_button_widget.dart';
import 'package:firebase_sample/auth/widgets/login_register_now_widget.dart';
import 'package:flutter/material.dart';

class LoginColumnWidget extends StatelessWidget {
  const LoginColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginHeadingWidget(),
        LoginContainerWidget(),
        LoginRegisterNowWidget(),
        LoginPhoneGoogleButtonWidget(),
      ],
    );
  }
}
