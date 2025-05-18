import 'package:firebase_sample/view/adding/widgets/stack_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_intl_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_sample/widgets/constants.dart';

class StudentAddingScreen extends StatelessWidget {
  const StudentAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kwhite,
      body: StackWidget(),
    );
  }
}
