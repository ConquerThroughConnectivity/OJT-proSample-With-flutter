import 'package:firebase_auth/firebase_auth.dart';
import 'package:testing/src/models/userID_model.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Users userFromFirebase(FirebaseUser user) {
    return user != null ? Users(id: user.uid) : null;
  }

  Stream<Users> get _user {
    return auth.onAuthStateChanged.map(userFromFirebase);
  }

  Future registerEmailPassword(String email, String password) async {
    try {
      AuthResult res = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = res.user;
      return userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signout() async {
    try {
      return await auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
