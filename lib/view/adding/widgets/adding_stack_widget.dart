import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/utils/utils.dart';
import 'package:firebase_sample/view/adding/widgets/adding_form_field_widget.dart';
import 'package:firebase_sample/view/auth/widgets/login_intl_stack_waveclipper.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            height: screenHeight * 1 / 3,
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
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:const EdgeInsets.only(right: 16, top: 10),
              child: IconButton(
                onPressed: () async {
                  AppUtils.alertDialogueFunction(
                    context,
                    Icons.logout,
                    "Confirm Logout",
                    "Are you sure, You want to Logout?",
                    "Logout",
                    () async {
                      await Provider.of<AuthenticationProvider>(
                        context,
                        listen: false,
                      ).logOut(context);
                      if(context.mounted){
                         Navigator.of(context).pop();

                      }
                     
                    },
                  );
                },
                icon: const Icon(
                  Icons.no_accounts,
                  color: kwhite,
                  size: 30,
                ),
              ),
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
                  child:const AddingFormFieldWidget(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
