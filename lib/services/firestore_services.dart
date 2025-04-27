import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static saveUser(email,uid)async{

    await FirebaseFirestore.instance.collection("user").doc(uid).set({"email":email});


  }
}