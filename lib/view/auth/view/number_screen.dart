import 'package:firebase_sample/view/auth/widgets/login_intlphone_field_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_intl_stack_widget.dart';
import 'package:flutter/material.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F8FA),
      body: SafeArea(
        child: Column(
          children: [
            StackWidget(),
            IntphoneFieldWidget(),
          ],
        ),
      ),
    );
  }
}
