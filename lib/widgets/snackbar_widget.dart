import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

void snackBarWidget(BuildContext context, String content,
    {bool isError = false}) {
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(20),
      content: Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: isError ? Colors.red : appColor,
      duration: const Duration(seconds: 2),
    ),
  );
}
