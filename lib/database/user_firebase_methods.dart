import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/app_user.dart';
import '../utils/show_toast.dart';
import 'user_local_data.dart';

class UserFirebaseMethods {
  // firebase variables
  static const String _fUser = 'user';
  static const String _uid = 'uid';
  static const String _username = 'username';
  static const String _displayName = 'displayName';
  static const String _email = 'email';
  static const String _imageURL = 'imageURL';

  // Firebase Methods
  Future addUser({
    @required String uid,
    @required Map<String, dynamic> userInfoMap,
  }) async {
    return FirebaseFirestore.instance
        .collection(_fUser)
        .doc(uid)
        .set(userInfoMap)
        .catchError((error) {
      showErrorToast(error.toString());
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfo(
      {@required String uid}) async {
    return FirebaseFirestore.instance.collection(_fUser).doc(uid).get();
  }

  Future<bool> isUserExist({@required String uid}) async {
    return FirebaseFirestore.instance.collection(_fUser).doc(uid).get().then(
          (value) => value.exists,
        );
  }

  Map<String, dynamic> userToMap({@required User user}) {
    return {
      _uid: user.uid,
      _displayName: user.displayName ?? '',
      _username: user.email.substring(0, user.email.indexOf('@')) ?? '',
      _email: user.email ?? '',
      _imageURL: user.photoURL ?? '',
    };
  }

  void updateUserLocalData({@required AppUser user}) {
    UserLocalData.setUID(user.getUID);
    UserLocalData.setDisplayName(user.getDisplayName);
    UserLocalData.setImageURL(user.getImageURL);
    UserLocalData.setEmail(user.getEmail);
    UserLocalData.setUsername(user.getEmail);
  }
}
