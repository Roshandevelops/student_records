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
      // appBar: AppBar(
      //   backgroundColor: kwhite,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CupertinoButton(
                    child: Icon(
                      CupertinoIcons.back,
                      color: kBlack,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  // color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Verification",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      kHeight,
                      Text(
                        "We have sent the code verification to",
                      ),
                      // kHeight,
                      Text(
                        "+91******0451",
                      ),
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
                          Future.delayed(
                            Duration.zero,
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) {
                                    return NumberScreen();
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Change phone number ?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xED012542),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // kHeight20,
                SizedBox(
                  // color: Colors.amber,
                  child: Column(
                    children: [
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
                      kHeight,
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Validate",
                          style: TextStyle(
                            fontSize: 18,
                            color: kBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Text(
                        "Didn't get the code ?",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Resent code",
                        style: TextStyle(
                          color: const Color(0xED012542),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      )
                    ],
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
