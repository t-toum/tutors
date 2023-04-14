import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';

@singleton
class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw const ServerException("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw const ServerException(
            "The account already exists for that email.");
      } else {
        throw ServerException(e.message);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw const ServerException('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw const ServerException('Wrong password provided for that user.');
      } else {
        throw ServerException(e.message);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final user = await _auth.signInWithCredential(credential);
      return user;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    } on PlatformException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn(scopes: <String>["email"]).signOut();
  }
}
