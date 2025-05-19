import 'package:firebase_sample/model/student_model.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class StudentCardAnimated extends StatefulWidget {
  final StudentModel studentModel;
  final VoidCallback onDelete;
  final String Function(DateTime) timeAgo;

  const StudentCardAnimated({
    super.key,
    required this.studentModel,
    required this.onDelete,
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
      begin: const Offset(1.0, 1.0), // from right
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
          onLongPress: widget.onDelete,
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
                        student.name.isNotEmpty
                            ? student.name[0].toUpperCase()
                            : '?',
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
                          Text(
                            safeText(student.name),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          // Text(
                          //   student.name,
                          //   style: const TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.black87,
                          //   ),
                          // ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.work_outline,
                                  size: 16, color: Colors.black54),
                              const SizedBox(width: 6),
                              Flexible(
                                  child: Text(
                                safeText(student.domain),
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black54),
                                overflow: TextOverflow.ellipsis,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.cake_outlined,
                        size: 16, color: Colors.black54),
                    const SizedBox(width: 6),
                    Text(
                      "Age: ${student.age}",
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 16, color: Colors.black54),
                    const SizedBox(width: 6),
                    Text(
                      getSafeTime(),
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
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
}
