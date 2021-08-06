import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  Future<DocumentSnapshot> getUserById(String id) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .get();
  }
}