import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/view/auth/widgets/login_textformfieldwidget.dart';
import 'package:firebase_sample/view/auth/widgets/login_checkbox_row_widget.dart';
import 'package:firebase_sample/widgets/material_button_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginContainerWidget extends StatefulWidget {
  const LoginContainerWidget({super.key});

  @override
  State<LoginContainerWidget> createState() => _LoginContainerWidgetState();
}

class _LoginContainerWidgetState extends State<LoginContainerWidget> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final forgotFormkey = GlobalKey<FormState>();
  final TextEditingController forgotEmailController = TextEditingController();

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
                LoginCheckboxRowWidget(
                  forgotEmailController: forgotEmailController,
                  forgotFormKey: forgotFormkey,
                ),
                MaterialButtonWidget(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();

                      await Provider.of<AuthenticationProvider>(
                        context,
                        listen: false,
                      ).emailLogin(
                          context, emailController, passwordController);
                    }
                  },
                  buttonText: "Sign in",
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
