import 'package:firebase_sample/view/auth/widgets/login_intl_stack_waveclipper.dart';
import 'package:firebase_sample/widgets/material_button_widget.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';

class StudentAddingScreen extends StatefulWidget {
  const StudentAddingScreen({super.key});

  @override
  State<StudentAddingScreen> createState() => _StudentAddingScreenState();
}

class _StudentAddingScreenState extends State<StudentAddingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController domainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: Stack(
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
                    Icon(Icons.school, size: 50, color: kwhite),
                    SizedBox(height: 10),
                    Text(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextformfieldWidget(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "Enter full name",
                              controller: nameController,
                            ),
                            // const SizedBox(height: 14),
                            kHeight,
                            TextformfieldWidget(
                              prefixIcon: const Icon(Icons.class_),
                              hintText: "Enter class or grade",
                              controller: classController,
                            ),
                            kHeight,
                            // const SizedBox(height: 14),
                            TextformfieldWidget(
                              prefixIcon: const Icon(Icons.cake),
                              hintText: "Enter age",
                              controller: ageController,
                            ),
                            // const SizedBox(height: 14),
                            kHeight,
                            TextformfieldWidget(
                              prefixIcon: const Icon(Icons.category),
                              hintText: "Enter domain (e.g., Science)",
                              controller: domainController,
                            ),
                            // const SizedBox(height: 25),
                            kHeight20,

                            MaterialButtonWidget(
                              formKey: _formKey,
                              buttonText: "Save Student",
                              onPressed: () {
                                // submitStudentData();
                              },
                              materialButtonColor: appColor,
                              buttonTextColor: kwhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void submitStudentData() {
  //   if (_formKey.currentState!.validate()) {
  //     snackBarWidget(context, "Student info saved successfully!");
  //     nameController.clear();
  //     classController.clear();
  //     ageController.clear();
  //     domainController.clear();
  //   }
  // }
}
