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
  const AddingFormFieldWidget({super.key});

  @override
  State<AddingFormFieldWidget> createState() => _AddingFormFieldWidgetState();
}

class _AddingFormFieldWidgetState extends State<AddingFormFieldWidget> {

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
          kHeight,
          TextformfieldWidget(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            keyboardType: TextInputType.number,
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
          kHeight,
          TextformfieldWidget(
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
          TextformfieldWidget(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Domain is Required";
              }

              return null;
            },
            prefixIcon: const Icon(Icons.domain),
            hintText: "Enter domain (e.g., Science)",
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
      final exists = await databaseServices.isRegNoExists(regNo);
      if (exists) {
        if (context.mounted) {
          snackBarWidget(
              context, "The register number you entered already exists");
        }
        setState(
          () {
            isLoading = false;
          },
        );
        return;
      }
      int parsedAge = int.parse(ageController.text.trim());
      StudentModel studentModel = StudentModel(
        regNoLower: regNoController.text.trim().toLowerCase(),
        regNo: regNoController.text,
        createdOn: Timestamp.now(),
        updatedOn: Timestamp.now(),
        name: nameController.text,
        age: parsedAge,
        domain: domainController.text,
        classes: classController.text,
      );
        setState(
        () {
          isLoading = false;
        },
      );
      await databaseServices.addTodo(studentModel);
      nameController.clear();
      classController.clear();
      ageController.clear();
      domainController.clear();
      regNoController.clear();
    
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) {
            return const HomeScreen();
          }),
          (route) {
            return false;
          },
        );
      }
    }
  }
}
