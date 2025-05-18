import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/services/database_services.dart';
import 'package:firebase_sample/view/home/home_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/material_button_widget.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({super.key});

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController classController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController domainController = TextEditingController();

  final DatabaseServices databaseServices = DatabaseServices();

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
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                return "Domain is Required";
              }

              return null;
            },
            prefixIcon: const Icon(Icons.category),
            hintText: "Enter domain (e.g., Science)",
            controller: domainController,
          ),
          kHeight20,
          MaterialButtonWidget(
            formKey: _formKey,
            buttonText: "Save Student",
            onPressed: () {
              submitStudentData(context);
            },
            materialButtonColor: appColor,
            buttonTextColor: kwhite,
          ),
        ],
      ),
    );
  }

  void submitStudentData(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      int parsedAge = int.parse(ageController.text.trim());
      StudentModel studentModel = StudentModel(
        createdOn: Timestamp.now(),
        updatedOn: Timestamp.now(),
        name: nameController.text,
        age: parsedAge,
        domain: domainController.text,
        classes: classController.text,
      );
      databaseServices.addTodo(studentModel);

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
