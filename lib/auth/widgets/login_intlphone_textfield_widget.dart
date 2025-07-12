import 'dart:developer';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginIntlphoneTextfieldWidget extends StatefulWidget {
  const LoginIntlphoneTextfieldWidget(
      {super.key, 
      required this.onPhoneNumberChanged
      });

  final Function(String) onPhoneNumberChanged;

  @override
  State<LoginIntlphoneTextfieldWidget> createState() =>
      _LoginIntlphoneTextfieldWidgetState();
}

class _LoginIntlphoneTextfieldWidgetState
    extends State<LoginIntlphoneTextfieldWidget> {
  String completePhoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntlPhoneField(
          initialCountryCode: "IN",
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: kwhite,
            hintText: 'Phone Number',
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          ),
          onChanged: (value) {
            setState(() {
                   completePhoneNumber = value.completeNumber;
            widget.onPhoneNumberChanged(completePhoneNumber);
            });
      
            log(" vasu Phone number: $completePhoneNumber");
          },
          // onCountryChanged: (value) {
          //   log(value.code);
          // },
          languageCode: "en",
        ),
        kHeight20,
        kHeight20,
      ],
    );
  }
}
