import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/app_user.dart';
import '../utils/show_toast.dart';
import 'user_firebase_methods.dart';
import 'user_local_data.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> signupWithEmailAndPassword({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    try {
      final UserCredential result = await auth
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .catchError((Object obj) {
        showErrorToast(obj.toString());
        return null;
      });
      final User user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);
      if (user != null) {
        final Map<String, dynamic> userInfo = {
          'uid': user.uid,
          'name': name,
          'email': email,
        };
        UserFirebaseMethods().addUser(uid: user.uid, userInfoMap: userInfo);
      }
      return user;
    } catch (signUpError) {
      showErrorToast(signUpError.toString());
      return null;
    }
  }

  Future<User> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .catchError((obj) {
        showErrorToast(obj.toString());
        return null;
      });
      if (result != null) {
        final User user = result.user;
        final User currentUser = FirebaseAuth.instance.currentUser;
        assert(user.uid == currentUser.uid);
        UserLocalData.setUID(user.uid);
        final docs = await UserFirebaseMethods().getUserInfo(uid: user.uid);
        final AppUser appUser = AppUser.fromDocument(docs);
        UserFirebaseMethods().updateUserLocalData(user: appUser);
        return user;
      }
    } catch (signUpError) {
      showErrorToast(signUpError.toString());
      return null;
    }
    return null;
  }

  Future signOut() async {
    UserLocalData.signout();
    await FirebaseAuth.instance.signOut();
  }
}
