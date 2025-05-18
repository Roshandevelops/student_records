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

  static void alertDialogueFunction(
    BuildContext context,
    IconData? icon,
    String mainText,
    String subText,
    String confirm,
    void Function()? onPressed,
  ) async {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 60, color: Colors.redAccent),
              const SizedBox(height: 15),
              Text(
                mainText,
                style:const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subText,
                textAlign: TextAlign.center,
                style:const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Logout Button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // Gradient background with decoration workaround
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: onPressed,
                      child: Text(
                        confirm,
                        style:const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
