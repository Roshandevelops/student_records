import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final String name;
  final int age;
  final String classes;
  final String domain;
  final Timestamp createdOn;
  final Timestamp updatedOn;
  final String? id;
  final String? regNo;
   final String regNoLower;

  StudentModel(
      {required this.name,
      required this.age,
      required this.classes,
      required this.domain,
      required this.createdOn,
      required this.updatedOn,
      required this.regNo,
      required this.regNoLower,
      this.id});

  factory StudentModel.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return StudentModel(
      name: data["name"],
      age: data["age"],
      classes: data["classes"],
      domain: data["domain"],
      createdOn: data["createdOn"],
      updatedOn: data["updatedOn"],
      regNo: data["regNo"],
      regNoLower: data["regNoLower"],
      id: doc.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "regNo": regNo,
      "regNoLower": regNoLower,
      "age": age,
      "classes": classes,
      "domain": domain,
      "createdOn": createdOn,
      "updatedOn": updatedOn,
    };
  }
}
