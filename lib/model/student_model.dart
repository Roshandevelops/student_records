import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
 final String name;
 final int age;
 final String classes;
 final String domain;
 final Timestamp createdOn;
 final Timestamp updatedOn;
  

  StudentModel({
    required this.name,
    required this.age,
    required this.classes,
    required this.domain,
    required this.createdOn,
    required this.updatedOn,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json["name"],
      age: json["age"],
      classes: json["classes"],
      domain: json["domain"],
      createdOn: json["createdOn"],
      updatedOn: json["updatedOn"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "classes": classes,
      "domain": domain,
      "createdOn":createdOn,
      "updatedOn":updatedOn,
    };
  }
}
