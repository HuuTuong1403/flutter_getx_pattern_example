import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class UserRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future getDataOfUser() async {
    User user = _auth.currentUser!;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    return userDoc;
  }

  Future logOut() async {
    final facebookLogIn = FacebookLogin();
    await _auth.signOut();
    await facebookLogIn.logOut();
  }
}
