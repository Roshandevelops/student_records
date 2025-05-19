import 'package:firebase_sample/view/auth/widgets/login_register_now_stack_widget.dart';
import 'package:flutter/material.dart';

class RegisterNowScreen extends StatelessWidget {
  const RegisterNowScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF9F9F9),
      body: LoginRegisterNowStackWidget(),
    );
  }
}
