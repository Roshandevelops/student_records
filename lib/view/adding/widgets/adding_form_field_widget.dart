import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/services/database_services.dart';
import 'package:firebase_sample/view/home/view/home_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/material_button_widget.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddingFormFieldWidget extends StatefulWidget {
  final StudentModel? student;
  const AddingFormFieldWidget({super.key, this.student});

  @override
  State<AddingFormFieldWidget> createState() => _AddingFormFieldWidgetState();
}

class _AddingFormFieldWidgetState extends State<AddingFormFieldWidget> {
  @override
  void initState() {
    if (widget.student != null) {
      nameController.text = widget.student!.name;
      regNoController.text = widget.student!.regNo!;
      classController.text = widget.student!.classes;
      ageController.text = widget.student!.age.toString();
      domainController.text = widget.student!.domain;
    }
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController domainController = TextEditingController();
  final DatabaseServices databaseServices = DatabaseServices();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextformfieldWidget(
            hintStyle: TextStyle(color: kwhite),
            contentStyle: TextStyle(color: kwhite),
            fillColor: appColor,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Name is Required";
              }
              return null;
            },
            prefixIcon: const Icon(Icons.person),
            hintText: "Enter Full Name",
            controller: nameController,
          ),
          kHeight,
          TextformfieldWidget(
            hintStyle: TextStyle(color: kwhite),
            contentStyle: TextStyle(color: kwhite),
            fillColor: appColor,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.cake),
            hintText: "Enter Age",
            controller: ageController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Age is Required";
              } else if (int.tryParse(value.trim()) == null) {
                return "Enter a Valid Number";
              }
              return null;
            },
          ),
          kHeight,
          TextformfieldWidget(
            hintStyle: TextStyle(color: kwhite),
            contentStyle: TextStyle(color: kwhite),
            fillColor: appColor,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Reg No. is Required";
              }

              return null;
            },
            prefixIcon: const Icon(Icons.format_list_numbered_rtl),
            hintText: "Enter Reg No",
            controller: regNoController,
          ),
          kHeight,
          TextformfieldWidget(
            hintStyle: TextStyle(color: kwhite),
            contentStyle: TextStyle(color: kwhite),
            fillColor: appColor,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Class is Required";
              }

              return null;
            },
            prefixIcon: const Icon(Icons.class_),
            hintText: "Enter Class or Grade",
            controller: classController,
          ),
          kHeight,
          TextformfieldWidget(
            hintStyle: TextStyle(color: kwhite),
            contentStyle: TextStyle(color: kwhite),
            fillColor: appColor,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Domain is Required";
              }

              return null;
            },
            prefixIcon: const Icon(Icons.domain),
            hintText: "Enter Domain (e.g., Science)",
            controller: domainController,
          ),
          kHeight20,
          // if (isLoading)
          //   Padding(
          //     padding: EdgeInsets.only(bottom: 10),
          //     child: CircularProgressIndicator(),
          //   ),
          MaterialButtonWidget(
            isLoading: isLoading,
            buttonWidth: double.infinity,
            formKey: _formKey,
            buttonText: "Save Student",
            onPressed: () {
              saveStudentData(context);
            },
            materialButtonColor: appColor,
            buttonTextColor: kwhite,
          ),
        ],
      ),
    );
  }

  Future<void> saveStudentData(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final regNo = regNoController.text.trim();
      int parsedAge = int.parse(ageController.text.trim());

      // For new student
      if (widget.student == null) {
        final exists = await databaseServices.isRegNoExists(regNo);
        if (exists) {
          if (context.mounted) {
            snackBarWidget(
                context, "The register number you entered already exists");
          }
          setState(() => isLoading = false);
          return;
        }

        final newStudent = StudentModel(
          regNoLower: regNo.toLowerCase(),
          regNo: regNo,
          createdOn: Timestamp.now(),
          updatedOn: Timestamp.now(),
          name: nameController.text,
          age: parsedAge,
          domain: domainController.text,
          classes: classController.text,
        );

        await databaseServices.addTodo(newStudent);
      } else {
        // For updating existing student
        final updatedStudent = StudentModel(
          id: widget.student!.id,
          regNoLower: widget.student!.regNoLower,
          regNo: widget.student!.regNo,
          createdOn: widget.student!.createdOn,
          updatedOn: Timestamp.now(),
          name: nameController.text,
          age: parsedAge,
          domain: domainController.text,
          classes: classController.text,
        );

        await databaseServices.updateTodo(updatedStudent);
      }

      setState(() => isLoading = false);

      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()),
          (route) => false,
        );
      }
    }
  }

//   Future<void> saveStudentData(BuildContext context) async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         isLoading = true;
//       });
//       final regNo = regNoController.text.trim();

//       if(widget.student==null){
//  final exists = await databaseServices.isRegNoExists(regNo);
//       if (exists) {
//         if (context.mounted) {
//           snackBarWidget(
//               context, "The register number you entered already exists");
//         }
//       }

//         setState(
//           () {
//             isLoading = false;
//           },
//         );
//         return;
//       }
//       int parsedAge = int.parse(ageController.text.trim());
//       StudentModel studentModel = StudentModel(
//         regNoLower: regNoController.text.trim().toLowerCase(),
//         regNo: regNoController.text,
//         createdOn: Timestamp.now(),
//         updatedOn: Timestamp.now(),
//         name: nameController.text,
//         age: parsedAge,
//         domain: domainController.text,
//         classes: classController.text,
//       );
//       setState(
//         () {
//           isLoading = false;
//         },
//       );
//       await databaseServices.addTodo(studentModel);
//       nameController.clear();
//       classController.clear();
//       ageController.clear();
//       domainController.clear();
//       regNoController.clear();

//       if (context.mounted) {
//         Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (ctx) {
//             return const HomeScreen();
//           }),
//           (route) {
//             return false;
//           },
//         );
//       }
//     }
//   }
}
