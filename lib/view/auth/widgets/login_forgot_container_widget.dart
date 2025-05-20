import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/text_button_widget.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForgotContainerWidget extends StatefulWidget {
  const LoginForgotContainerWidget({
    super.key,
    required this.forgotEmailController,
    required this.forgotFormKey,
  });

  final GlobalKey<FormState> forgotFormKey;
  final TextEditingController forgotEmailController;

  @override
  State<LoginForgotContainerWidget> createState() =>
      _LoginForgotContainerWidgetState();
}

class _LoginForgotContainerWidgetState
    extends State<LoginForgotContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 15),
          )
        ],
      ),
      child: Column(
        children: [
          TextformfieldWidget(
            // labelText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.contains('@gmail.com')) {
                return emailErrorDialogue;
              }
              return null;
            },
            fillColor: Colors.grey.shade100,
            controller: widget.forgotEmailController,
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: "Email",
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: TextButtonWidget(
              text: "Reset Password",
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: appColor,
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: appColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                if (widget.forgotFormKey.currentState!.validate()) {
                  widget.forgotFormKey.currentState!.save();
                  await Provider.of<AuthenticationProvider>(context,
                          listen: false)
                      .resetPassword(context, widget.forgotEmailController);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
