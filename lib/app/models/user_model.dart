import 'package:firebase_auth/firebase_auth.dart';

class NiceUser {
 late String id;
  NiceUser.fromFirebase(User user){
    id = user.uid;
  }
}