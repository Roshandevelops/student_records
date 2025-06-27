import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/services/database_services.dart';
import 'package:firebase_sample/utils/utils.dart';
import 'package:firebase_sample/view/home/widgets/student_card_animated_widget.dart';
import 'package:firebase_sample/view/search/search_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomScrollViewWidget extends StatefulWidget {
  const CustomScrollViewWidget(
      {super.key, required this.snapshot, this.students});
  final AsyncSnapshot<List<StudentModel>> snapshot;
  final List<StudentModel>? students;
  @override
  State<CustomScrollViewWidget> createState() => _CustomScrollViewWidgetState();
}

class _CustomScrollViewWidgetState extends State<CustomScrollViewWidget> {
  final DatabaseServices databaseServices = DatabaseServices();
  @override
  Widget build(BuildContext context) {
    final List<StudentModel> todos = widget.snapshot.data ?? [];
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: appColor,
          expandedHeight: 160,
          elevation: 4,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    students:widget.snapshot.data??[]
                    //  widget.students ?? [],
                  ),
                ));
              },
              icon:const Icon(
                CupertinoIcons.search,
                size: 25,
                color: kwhite,
              ),
            ),
            IconButton(
              tooltip: "Logout",
              onPressed: () async {
                await logoutUser(context);
              },
              icon: const Icon(Icons.logout, color: Colors.white, size: 30),
            ),
          ],
          flexibleSpace: const FlexibleSpaceBar(
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final studentModel = todos[index];
                  final todoId = todos[index].id;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: StudentCardAnimated(

                      index: todos.length - index - 1,
                      studentModel: studentModel,
                      onDelete: () async {
                        await deleteItem(todoId!, context);
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
  }

  Future<void> logoutUser(BuildContext context) async {
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

  Future<void> deleteItem(String todoId, BuildContext context) async {
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

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hrs ago';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return DateFormat('dd MMM yyyy').format(date);
  }
}
