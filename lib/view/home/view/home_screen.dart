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
      backgroundColor: const Color(0xfff0f4f8),
      body: StreamBuilder<List<StudentModel>>(
        stream: databaseServices.getTodos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<StudentModel> todos = snapshot.data ?? [];

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: appColor,
                expandedHeight: 160,
                elevation: 4,
                // shape: const RoundedRectangleBorder(
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(24),
                //     bottomRight: Radius.circular(24),
                //   ),
                // ),
                actions: [
                  IconButton(
                    tooltip: "Logout",
                    onPressed: () async => await logoutUser(),
                    icon:
                        const Icon(Icons.logout, color: Colors.white, size: 30),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 24,
                      ),
                      kWidth,
                      Text(
                        "Student Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (todos.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      "No student data available",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final studentModel = todos[index];
                        final todoId = todos[index].id;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: StudentCardAnimated(
                            studentModel: studentModel,
                            onDelete: () async {
                              await deleteItem(todoId!);
                            },
                            timeAgo: timeAgo,
                          ),
                        );
                      },
                      childCount: todos.length,
                    ),
                  ),
                ),
            ],
          );
        },
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

  Future<void> deleteItem(String todoId) async {
    AppUtils.alertDialogueFunction(
      context,
      Icons.delete,
      "Confirm Delete",
      "Are you sure you want to delete this student?",
      "Delete",
      () {
        databaseServices.deleteTodo(todoId);
        Navigator.of(context).pop(true);
      },
    );
  }

  Future<void> logoutUser() async {
    AppUtils.alertDialogueFunction(
      context,
      Icons.logout,
      "Confirm Logout",
      "Are you sure you want to logout?",
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
  }
}
