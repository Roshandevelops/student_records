import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/view/adding/widgets/adding_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_sample/widgets/constants.dart';

class StudentAddingScreen extends StatelessWidget {

 
  const StudentAddingScreen({super.key,this.student});

     final StudentModel? student;

 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kwhite,
      body: AddingStackWidget(student:student),
    );
  }
}
