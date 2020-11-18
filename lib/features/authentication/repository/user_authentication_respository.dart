import 'package:firebase_auth/firebase_auth.dart';

class UserAuthenticationRespository {
  FirebaseAuth auth = FirebaseAuth.instance;

  User get user => auth.currentUser;

  Future<String> get token => auth.currentUser.getIdToken();

  bool get isLoggedIn =>
      auth.currentUser != null && auth.currentUser.getIdToken() != null;

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    var authCredentials =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return authCredentials.user;
  }

  Future<User> signUpWithEmailAndPassword(String email, String password) async {
    var authCredentials = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authCredentials.user;
  }

  Future<void> signOut() async {
    auth.signOut();
  }
}
