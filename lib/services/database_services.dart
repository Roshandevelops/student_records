import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/model/student_model.dart';

const String TODO_COLLECTION_REF = "todo";

class DatabaseServices {
  final fireStore = FirebaseFirestore.instance;
  late final CollectionReference todoRefs;

  DatabaseServices() {
    todoRefs =
        fireStore.collection(TODO_COLLECTION_REF).withConverter<StudentModel>(
              fromFirestore: (snapshots, _) =>
                  StudentModel.fromJson(snapshots.data()!),
              toFirestore: (todo, _) => todo.toJson(),
            );
  }

  Stream<QuerySnapshot> getTodos() {
    return todoRefs
        .orderBy(
          "createdOn",
          descending: true,
        )
        .snapshots();
  }

  void addTodo(StudentModel studentModel) async {
    await todoRefs.add(studentModel);
  }

  void deleteTodo(String todoId) async {
    await todoRefs.doc(todoId).delete();
  }
}
