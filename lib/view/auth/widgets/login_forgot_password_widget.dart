import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/text_button_widget.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForgotPasswordWidget extends StatelessWidget {
  const LoginForgotPasswordWidget({
    super.key,
    required this.forgotFormKey,
    required this.forgotEmailController,
  });

  final GlobalKey<FormState> forgotFormKey;
  final TextEditingController forgotEmailController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: forgotFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                kHeight20,
                const Text(
                  textAlign: TextAlign.center,
                  "Enter your registered email below. We'll send \nyou a link to reset your password.",
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                TextformfieldWidget(
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return emailErrorDialogue;
                    } else {
                      return null;
                    }
                  },
                  fillColor: kwhite,
                  controller: forgotEmailController,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.teal,
                  ),
                  hintText: "Email",
                ),
                const SizedBox(height: 30),
                Center(
                  child: TextButtonWidget(
                    textStyle: TextStyle(
                      color: appColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    style: TextButton.styleFrom(),
                    text: "Reset Password",
                    onPressed: () async {
                      if (forgotFormKey.currentState!.validate()) {
                        forgotFormKey.currentState!.save();
                        await Provider.of<AuthenticationProvider>(context,
                                listen: false)
                            .resetPassword(context, forgotEmailController);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
