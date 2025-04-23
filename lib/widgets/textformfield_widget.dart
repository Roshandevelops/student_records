import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({super.key,required this.hintText,required this.textEditingController,});
  final String hintText;
  final TextEditingController textEditingController;
  // final TextEditingController passController;


  @override
  Widget build(BuildContext context) {

    return  TextFormField(
              style: const TextStyle(
                color: kBlack,
              ),
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText:hintText,
                hintStyle: const TextStyle(
                  color: kBlack,
                ),
              ),
            );
  }
}