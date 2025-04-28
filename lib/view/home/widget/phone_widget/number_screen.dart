import 'package:firebase_sample/view/home/widget/phone_widget/intphone_field_widget.dart';
import 'package:firebase_sample/view/home/widget/phone_widget/stack_widget.dart';
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
