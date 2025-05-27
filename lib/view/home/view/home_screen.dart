import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/services/database_services.dart';
import 'package:firebase_sample/view/adding/view/student_adding_screen.dart';
import 'package:firebase_sample/view/home/widgets/custom_scroll_view_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseServices databaseServices = DatabaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f4f8),
      body: StreamBuilder<List<StudentModel>>(
        stream: databaseServices.getTodos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return  CustomScrollViewWidget(snapshot:snapshot);
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: appColor,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const StudentAddingScreen(),
            ),
          );
        },
        label: const Text(
          "Add Student",
          style: TextStyle(color: kwhite),
        ),
        icon: const Icon(
          Icons.add,
          color: kwhite,
        ),
      ),
    );
  }
}
