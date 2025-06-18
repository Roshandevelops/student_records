import 'package:firebase_sample/view/adding/widgets/adding_form_field_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_intl_stack_waveclipper.dart';
import 'package:firebase_sample/view/home/view/home_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class AddingStackWidget extends StatelessWidget {
  const AddingStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: screenHeight * 1 / 2.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: linearGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school,
                  size: 50,
                  color: kwhite,
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "Add Student Details",
                  style: TextStyle(
                    fontSize: 26,
                    color: kwhite,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 0,
            bottom: 0,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const HomeScreen();
                  },
                ),
                (route) {
                  return false;
                },
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kwhite,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                const SizedBox(height: 200),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 12,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const AddingFormFieldWidget(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
