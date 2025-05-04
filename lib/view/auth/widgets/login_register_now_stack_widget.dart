import 'package:firebase_sample/view/auth/widgets/login_register_now_textform_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginRegisterNowStackWidget extends StatefulWidget {
  const LoginRegisterNowStackWidget({super.key});

  @override
  State<LoginRegisterNowStackWidget> createState() =>
      _LoginRegisterNowStackWidgetState();
}

class _LoginRegisterNowStackWidgetState
    extends State<LoginRegisterNowStackWidget> {
  final TextEditingController registerEmailController = TextEditingController();

  final TextEditingController registerPassController = TextEditingController();

  final TextEditingController confirmRegisterPassController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF08AD9D), Color(0xFF1D8076)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ready to Explore?",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kwhite,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "A few taps away from awesome",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: LoginRegisterNowTextformWidget(
                  registerEmailController: registerEmailController,
                  registerPassController: registerPassController,
                  confirmRegisterPassController: confirmRegisterPassController,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
