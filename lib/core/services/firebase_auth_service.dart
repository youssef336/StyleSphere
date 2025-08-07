import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:stylesphere_app/core/errors/exception.dart';
import 'package:stylesphere_app/core/services/main/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final auth = FirebaseAuth.instance;
  late User clinet;

  @override
  Future<User> loginUser(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      clinet = credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
          message:
              " User with this email doesn't exist, please create an account",
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message:
              "Incorrect password, please check your password and try again",
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "Please check your internet connection");
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: "Please enter a valid email address");
      } else {
        throw CustomException(
          message: "An error occurred while logging in, please try again later",
        );
      }
    }
    return clinet;
  }

  @override
  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw CustomException(message: "Email already in use");
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "Please check your internet connection");
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: "Please enter a valid email address");
      } else {
        throw CustomException(
          message: "An error occurred while signing up, please try again later",
        );
      }
    }
  }

  @override
  @override
  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(
        serverClientId:
            '725140031864-s1hu0sk68c5dflhptgh20n958pbp4jd1.apps.googleusercontent.com',
      );

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      clinet = userCredential.user!;
      return clinet;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw CustomException(message: 'Sign-in cancelled by user');
      } else {
        throw CustomException(
          message: 'Google Sign-In failed: ${e.description}',
        );
      }
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message ?? 'Firebase auth failed');
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<User> signInWithFacebook() async {
    try {
      // Trigger the Facebook sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      // Check for success
      if (result.status != LoginStatus.success || result.accessToken == null) {
        throw CustomException(
          message: 'Facebook login failed: ${result.message}',
        );
      }

      // Create Facebook credential
      final OAuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );

      // Sign in to Firebase with the Facebook credential
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user == null) {
        throw CustomException(message: 'No user returned from Facebook login.');
      }

      // Store the user if needed
      clinet = user;
      return clinet;
    } on FirebaseAuthException catch (e) {
      throw CustomException(
        message: e.message ?? 'Firebase authentication failed.',
      );
    } catch (e) {
      throw CustomException(message: 'Unexpected error: ${e.toString()}');
    }
  }
}

bool isUserLoggedIn() {
  return FirebaseAuth.instance.currentUser != null;
}
