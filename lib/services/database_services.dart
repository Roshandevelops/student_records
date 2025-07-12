import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/model/student_model.dart';

const String todoCollectionRef = "todo";

class DatabaseServices {
  final fireStore = FirebaseFirestore.instance;

  Stream<List<StudentModel>> getTodos() {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return fireStore
        .collection(todoCollectionRef)
        .doc(userId)
        .collection("notes")
        .orderBy("createdOn", descending: true)
        .snapshots()
        .map((event) => event.docs
            .map(
              (e) => StudentModel.fromJson(e),
            )
            .toList());
  }

  Future<void> addTodo(StudentModel studentModel) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await fireStore
        .collection(todoCollectionRef)
        .doc(userId)
        .collection("notes")
        .doc()
        .set(
          studentModel.toJson(),
        );
  }

  void deleteTodo(String todoId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await fireStore
        .collection(todoCollectionRef)
        .doc(userId)
        .collection("notes")
        .doc(todoId)
        .delete();
    
  }

  Future<bool> isRegNoExists(String regNo) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final querySnapshot = await fireStore
        .collection(todoCollectionRef)
        .doc(userId)
        .collection("notes")
        .where("regNoLower", isEqualTo: regNo.toLowerCase())
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> updateTodo(StudentModel studentModel) async {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  if (studentModel.id == null || studentModel.id!.isEmpty) {
    throw Exception("Student ID is missing for update.");
  }

  await fireStore
      .collection(todoCollectionRef)
      .doc(userId)
      .collection("notes")
      .doc(studentModel.id)
      .update(studentModel.toJson());
}
}
