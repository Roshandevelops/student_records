import 'package:firebase_sample/services/database_services.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static final commonTypos = [
    "gamil.com",
    "gnail.com",
    "gmaill.com",
    "gamail.com",
    "hotnail.com",
    "yahho.com",
    "yaho.com",
  ];
  static String suggestDomain(String wrongDomain) {
    switch (wrongDomain) {
      case "gamil.com":
      case "gnail.com":
      case "gmaill.com":
      case "gamail.com":
        return "gmail.com";
      case "hotnail.com":
        return "hotmail.com";
      case "yahho.com":
      case "yaho.com":
        return "yahoo.com";
      default:
        return "a valid email domain";
    }
  }

  static Future<bool?> showDeleteConfirmDialog(
      BuildContext context, String todoId) async {
    final DatabaseServices databaseServices = DatabaseServices();

    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text(
            textAlign: TextAlign.center,
            'Are you sure you want to delete this entry ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: appColor),
            onPressed: () {
              databaseServices.deleteTodo(todoId);
              Navigator.of(ctx).pop(true);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
