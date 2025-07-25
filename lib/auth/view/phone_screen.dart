import 'package:firebase_sample/auth/widgets/login_intlphone_field_widget.dart';
import 'package:firebase_sample/auth/widgets/login_intl_stack_widget.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF5F8FA),
      body: Column(
        children: [
          LoginIntlStackWidget(),
          IntlphoneFieldWidget(),
        ],
      ),
    );
  }
}
