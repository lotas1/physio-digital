import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:physio_digital/services/auth/login_or_signup.dart';
import 'package:physio_digital/view/home/home_page.dart';

class AuthService {
  //inistance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in
  Future<UserCredential> SignInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _navigateToHome();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _navigateToHome();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _navigateToLogin();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  void _navigateToHome() {
    Get.offAll(HomePage());
  }

  void _navigateToLogin() {
    Get.offAll(LoginOrSignup());
  }
}
