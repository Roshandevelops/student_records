import 'package:firebase_sample/view/auth/widgets/login_textformfieldwidget.dart';
import 'package:firebase_sample/view/auth/widgets/login_checkbox_row_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_sign_button_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginContainerWidget extends StatefulWidget {
  const LoginContainerWidget({super.key});

  @override
  State<LoginContainerWidget> createState() => _LoginContainerWidgetState();
}

class _LoginContainerWidgetState extends State<LoginContainerWidget> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: linearGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.shade700.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                LoginEmailTextformfieldwidget(
                  emailController: emailController,
                  passController: passwordController,
                ),
                const LoginCheckboxRowWidget(),
                LoginSignButtonWidget(
                  formKey: _formkey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
