import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<NiceUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return NiceUser.fromFirebase(user);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
    Future<NiceUser?> registerWithEmailAndPassword(String email,
        String password) async {
      try {
        UserCredential result = await _fAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        User user = result.user!;
        return NiceUser.fromFirebase(user);
      } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      }
      return null;
    }

    Future logOut() async {
      await _fAuth.signOut();
    }

  Future<NiceUser?> getUser() async {
    return NiceUser.fromFirebase(_fAuth.currentUser!);
  }

  }
