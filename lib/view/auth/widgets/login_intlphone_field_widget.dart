import 'package:firebase_sample/view/auth/widgets/login_intlphone_textfield_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_send_otp_button_widget.dart';
import 'package:flutter/material.dart';

class IntlphoneFieldWidget extends StatefulWidget {
  const IntlphoneFieldWidget({super.key});

  @override
  State<IntlphoneFieldWidget> createState() => _IntlphoneFieldWidgetState();
}

class _IntlphoneFieldWidgetState extends State<IntlphoneFieldWidget> {
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            LoginIntlphoneTextfieldWidget(
              onPhoneNumberChanged: (value) {
                setState(
                  () {
                    completePhoneNumber = value;
                  },
                );
              },
            ),
            LoginSendOtpButtonWidget(completePhoneNumber: completePhoneNumber),
          ],
        ),
      ),
    );
  }
}
