import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kyros_app_mobile/models/contact_model.dart';
import 'package:kyros_app_mobile/models/user.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  String getCurrentID() {
    return _auth.currentUser!.uid;
  }

  KyrosUser? _userFromFirebaseUser(User user) {
    return user != null ? KyrosUser(id: 0, imageUrl: '', contact: Contact(name: 'Steeves', role: "manager", description: "hello, how are you doing", Image_URL: 'assets/Steeves.jpg'), name: '', contacts: [], uid: user.uid, ) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;


      // Map<String, dynamic> userInfoMap = {
      //   "email": user!.email,
      //   // "username": user.email!.replaceAll("@gmail.com", "")
      //   "username": user.email!.substring(0, user.email!.indexOf("@"))
      // };

      FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
        "email": user.email,
        "username": user.email!.substring(0, user.email!.indexOf("@"))
      });

      // DatabaseService().addUserInfoToDB(user.uid, userInfoMap);
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if(result != null){
        FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
          "email": email,
          "username": email.substring(0, email.indexOf("@"))
        });
      }
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
