import 'package:firebase_sample/view/home/home_screen.dart';
import 'package:firebase_sample/widgets/outlined_button_widget.dart';
import 'package:firebase_sample/view/phone/number_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoButton(
                child: Icon(
                  CupertinoIcons.back,
                  color: kBlack,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "Verification code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              Text(
                "We have sent the code verification to",
              ),
              kHeight,
              Row(
                children: [
                  Text(
                    "+91******0451",
                  ),
                  kWidth20,
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (ctx) => HomeScreen(),
                        ),
                        // ModalRoute.withName("homescreen"),
                        (route) {
                          return false;
                        },
                      );
                      Future.delayed(Duration.zero, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) {
                              return NumberScreen();
                            },
                          ),
                        );
                      });
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (ctx) {
                      //       return PhoneScreen();

                      //     },
                      //   ),
                      // );
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (ctx) {
                      //       return PhoneScreen();
                      //     },
                      //   ),
                      // );
                    },
                    child: Text(
                      "Change phone number ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xED012542),
                      ),
                    ),
                  ),
                ],
              ),
              kHeight20,
              OtpTextField(
                decoration: InputDecoration(hintText: "0"),
                onCodeChanged: (value) {
                  // if (value.length == 1) {
                  //   FocusScope.of(context).nextFocus();
                  // }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  // LengthLimitingTextInputFormatter(1)
                ],
                fieldWidth: 50,
                fieldHeight: 50,
                numberOfFields: 4,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                keyboardType: TextInputType.number,
              ),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButtonWidget(
                    onPressed: () {
                      print("pressed resend");
                    },
                    child: Text(
                      "Resend",
                      style: textStyleBlack,
                    ),
                  ),
                  OutlinedButtonWidget(
                    onPressed: () {
                      print("pressed confirm");
                    },
                    child: Text(
                      "Confirm",
                      style: textStyleBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
