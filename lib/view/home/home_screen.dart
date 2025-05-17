import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/services/database_services.dart';
import 'package:firebase_sample/view/adding/student_adding_screen.dart';
import 'package:firebase_sample/view/home/widgets/student_animated_card_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseServices databaseServices = DatabaseServices();

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hrs ago';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f4f8),
      body: SafeArea(
        child: StreamBuilder(
          stream: databaseServices.getTodos(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List todos = snapshot.data?.docs ?? [];

            if (todos.isEmpty) {
              return const Center(
                child:
                    Text("No data available", style: TextStyle(fontSize: 18)),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                StudentModel studentModel = todos[index].data();
                String todoId = todos[index].id;

                return StudentCardAnimated(
                  studentModel: studentModel,
                  onDelete: () async {
                    final confirmed =
                        await showDeleteConfirmDialog(context, todoId);
                    if (confirmed == true) {
                      databaseServices.deleteTodo(todoId);
                    }
                  },
                  timeAgo: timeAgo,
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColor,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const StudentAddingScreen()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Future<bool?> showDeleteConfirmDialog(
      BuildContext context, String todoId) async {
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
