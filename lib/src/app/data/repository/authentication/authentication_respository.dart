import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } catch (e) {
      return e;
    }
  }

  Future signUp(
      String email, String password, String username, String phone) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final _uid = _auth.currentUser!.uid;
        await FirebaseFirestore.instance.collection('users').doc(_uid).set(
            {'id': _uid, 'username': username, 'email': email, 'phone': phone});
        return 'success';
      });
    } catch (e) {
      return e;
    }
  }
}
