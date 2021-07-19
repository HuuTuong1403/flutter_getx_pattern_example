import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

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

  Future loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        final googleAuth = await googleAccount.authentication;
        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          final authResult =
              await _auth.signInWithCredential(GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ));
          await FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user!.uid)
              .set({
            'id': authResult.user!.uid,
            'username': authResult.user!.displayName,
            'email': authResult.user!.email,
            'phone': authResult.user!.phoneNumber,
          });
        }
      }
    } catch (e) {
      print('$e');
    }
  }

  Future logInWithFacebook() async {
    final facebookLogIn = FacebookLogin();
    final result = await facebookLogIn.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;

        final credential = FacebookAuthProvider.credential(accessToken.token);
        final authResult = await _auth.signInWithCredential(credential);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({
          'id': authResult.user!.uid,
          'phone': authResult.user!.phoneNumber,
          'username': authResult.user!.displayName,
          'email': authResult.user!.email,
        });
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('cancel');
        break;
      case FacebookLoginStatus.error:
        print('error');
        break;
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
