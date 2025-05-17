import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/services/database_services.dart';
import 'package:firebase_sample/view/auth/widgets/login_intl_stack_waveclipper.dart';
import 'package:firebase_sample/view/home/home_screen.dart';
import 'package:firebase_sample/widgets/material_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

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

  final DatabaseServices databaseServices = DatabaseServices();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 9, 107, 97),
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kwhite,
      body: Stack(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
                          // await Provider.of<AuthenticationProvider>(
                          //   context,
                          //   listen: false,
                          // ).logOut(context);
                        },
                        icon: Icon(
                          Icons.no_accounts,
                          color: kwhite,
                          size: 45,
                        ),
                      ),
                    ],
                  ),
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextformfieldWidget(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Name is Required";
                              }

                              return null;
                            },
                            prefixIcon: const Icon(Icons.person),
                            hintText: "Enter full name",
                            controller: nameController,
                          ),
                          // const SizedBox(height: 14),
                          kHeight,
                          TextformfieldWidget(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Class is Required";
                              }

                              return null;
                            },
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
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Age is Required";
                              } else if (int.tryParse(value.trim()) == null) {
                                return "Enter a Valid number";
                              }
                              return null;
                            },
                          ),
                          // const SizedBox(height: 14),
                          kHeight,
                          TextformfieldWidget(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Domain is Required";
                              }

                              return null;
                            },
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
                              submitStudentData();
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
    );
  }

  // Widget dataListView() {
  //   return SizedBox(
  //     height: MediaQuery.sizeOf(context).height * 0.80,
  //     width: MediaQuery.sizeOf(context).width,
  //     child: StreamBuilder(
  //       stream: databaseServices.getTodos(),
  //       builder: (context, snapshot) {
  //         List todos=snapshot.data?.docs??[];
  //         if(todos.isEmpty){
  //           Center(child: Text("No datas"),);

  //         }
  //         print(todos);
  //         return ListView();
  //       },
  //     ),
  //   );
  // }

  void submitStudentData() {
    if (_formKey.currentState!.validate()) {
      int parsedAge = int.parse(ageController.text.trim());
      StudentModel studentModel = StudentModel(
        createdOn: Timestamp.now(),
        updatedOn:Timestamp.now() ,
        name: nameController.text,
        age: parsedAge,
        domain: domainController.text,
        classes: classController.text,
      );
      databaseServices.addTodo(studentModel);

      // snackBarWidget(context, "Student info saved successfully!");
      nameController.clear();
      classController.clear();
      ageController.clear();
      domainController.clear();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) {
          return HomeScreen();
        }),
        (route) {
          return false;
        },
      );
    }
  }
}
