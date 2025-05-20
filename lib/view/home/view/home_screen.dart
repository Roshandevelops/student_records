import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/services/database_services.dart';
import 'package:firebase_sample/utils/utils.dart';
import 'package:firebase_sample/view/adding/view/student_adding_screen.dart';
import 'package:firebase_sample/view/home/widgets/student_animated_card_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AppUtils.alertDialogueFunction(
                context,
                Icons.logout,
                "Confirm Logout",
                "Are you sure, You want to Logout?",
                "Logout",
                () async {
                  await Provider.of<AuthenticationProvider>(
                    context,
                    listen: false,
                  ).logOut(context);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              );
            },
            icon:const Icon(
              Icons.no_accounts,
              size: 35,
            ),
          )
        ],
        backgroundColor: Colors.amber,
      ),
      backgroundColor: const Color(0xfff0f4f8),
      body: SafeArea(
        child: StreamBuilder<List<StudentModel>>(
          stream: databaseServices.getTodos(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            // log(snapshot.data.!.data().toString());
            List todos = snapshot.data ?? [];

            //         List todos = snapshot.data?.data((event) {
            //   return StudentModel.fromJson(event.data());
            // },).toList() ?? [];

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
                StudentModel studentModel = todos[index];
                String todoId = todos[index].id;

                return StudentCardAnimated(
                  studentModel: studentModel,
                  onDelete: () async {
                    AppUtils.alertDialogueFunction(
                      context,
                      Icons.delete,
                      "Confirm Delete",
                      "Are you sure, You want to Delete?",
                      "Delete",
                      () {
                        databaseServices.deleteTodo(todoId);
                        Navigator.of(context).pop(true);
                      },
                    );
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
            MaterialPageRoute(
              builder: (ctx) => const StudentAddingScreen(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
