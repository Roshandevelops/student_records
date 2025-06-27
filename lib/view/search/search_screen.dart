import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/view/home/widgets/student_card_animated_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.students});
  final List<StudentModel> students;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<StudentModel> filteredList = [];
  TextEditingController searchController = TextEditingController();

  void filterSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredList = [];
      });
      return;
    }

    final results = widget.students.where((student) {
      final nameLower = student.name.toLowerCase();
      final regNoLower = student.regNo?.toLowerCase() ?? '';
      final input = query.toLowerCase();

      return nameLower.contains(input) || regNoLower.contains(input);
    }).toList();

    setState(() {
      filteredList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kwhite,
          ),
        ),
        automaticallyImplyLeading: false,

        backgroundColor: appColor,
        // title: const Text("Search Students"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            kHeight,
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextformfieldWidget(
                  contentStyle: TextStyle(color: kBlack),
                  hintStyle: TextStyle(
                    color: kBlack,
                  ),
                  hintText: "Search by Name or Reg no",
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: kBlack,
                  ),
                  fillColor: kwhite,
                  onChanged: filterSearch,
                  controller: searchController,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kBlack),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                )

                //  TextFormField(
                //   controller: searchController,
                //   onChanged: filterSearch,
                //   decoration: InputDecoration(
                //     prefixIcon: const Icon(CupertinoIcons.search),
                //     hintText: "Search by name or reg no",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // ),
                ),
            Expanded(
              child: filteredList.isEmpty
                  ? const Center(child: Text("No Matching Students"))
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final student = filteredList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: StudentCardAnimated(
                            index: filteredList.length - index - 1,
                            studentModel: student,
                            onDelete: null, // or provide delete logic if needed
                            timeAgo: (date) =>
                                '', // or reuse your timeAgo function if needed
                          ),
                        );
                        //  ListTile(
                        //   leading: CircleAvatar(child: Text('${index + 1}')),
                        //   title: Text(student.name),
                        //   subtitle: Text("Reg No: ${student.regNo}"),
                        // );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
