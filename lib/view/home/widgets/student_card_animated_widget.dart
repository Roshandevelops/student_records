import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class StudentCardAnimated extends StatefulWidget {
  final StudentModel studentModel;
  final VoidCallback? onDelete;
  final String Function(DateTime) timeAgo;

  const StudentCardAnimated({
    super.key,
    required this.studentModel,
    this.onDelete,
    required this.timeAgo,
  });

  @override
  State<StudentCardAnimated> createState() => _StudentCardAnimatedState();
}

class _StudentCardAnimatedState extends State<StudentCardAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 1.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final student = widget.studentModel;

    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          // onLongPress: widget.onDelete,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: appColor,
                      radius: 30,
                      child: Text(
                        getInitials(student.name),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                safeText(student.name),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: widget.onDelete,
                                      icon: Icon(Icons.delete)),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          const SizedBox(width: 6),
                          Text(
                            "Age: ${student.age}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.format_list_numbered_rtl,
                        size: 18, color: appColor.withOpacity(0.8)),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "Reg: ${student.regNo}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    Icon(Icons.class_,
                        size: 18, color: appColor.withOpacity(0.8)),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        "Class: ${getCleanText(student.classes)}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    Icon(Icons.domain,
                        size: 18, color: appColor.withOpacity(0.8)),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "Domain: ${getCleanText(student.domain)}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      getSafeTime(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black45,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                //         IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                //       ],
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getSafeTime() {
    try {
      final date = widget.studentModel.createdOn.toDate();
      return widget.timeAgo(date);
    } catch (e) {
      debugPrint('Error parsing timestamp: $e');
      return "Time not available";
    }
  }

  String safeText(String input) {
    try {
      return String.fromCharCodes(input.runes);
    } catch (e) {
      debugPrint('Invalid UTF-16 sequence: $e');
      return 'Invalid';
    }
  }

  String getInitials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return '?';
    return trimmed[0].toUpperCase();
  }

  String getCleanText(String input) {
    final trimmed = input.trim();
    return trimmed.isEmpty ? 'Not specified' : trimmed;
  }
}
