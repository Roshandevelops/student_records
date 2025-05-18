import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/model/student_model.dart';

const String todoCollectionRef = "todo";

class DatabaseServices {
  final fireStore = FirebaseFirestore.instance;
  // late final CollectionReference todoRefs;

  DatabaseServices() {
    // todoRefs =
    //     fireStore.collection(todoCollectionRef).withConverter<StudentModel>(
    //           fromFirestore: (snapshots, _) =>
    //               StudentModel.fromJson(snapshots.data()!),
    //           toFirestore: (todo, _) => todo.toJson(),
    //         );
  }

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

  void addTodo(StudentModel studentModel) async {
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

    // await todoRefs.doc(todoId).delete();
  }
}
