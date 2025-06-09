
import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authserices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  User? get currentUSer => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null && user.email != null && user.email!.isNotEmpty) {
        final prefs = await SharedPrefHelper.getInstance();
        await prefs.saveUserEmail(user.email!);
        await prefs.setIsLoggedIn(true);
        await prefs.setLoggedInUserId(user.uid.hashCode);


        final existingUser = await _databaseHelper.getCurrentUser(user.email!);
        if (existingUser == null) {
          await _databaseHelper.insertUser({
            'name': user.displayName ?? '',
            'email': user.email!,
            'contact': 0,
            'password': '',
            'profileimage': user.photoURL ?? ''
          });
        }

        final ebook = await _databaseHelper.getAllEbooks();

        Navigator.pushReplacementNamed(context, '/home', arguments: ebook);
      }
    } catch (e) {
      print("Google Sign-In failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Google Sign-In failed')));
    }
  }

  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await firebaseAuth.signOut();

      print('User signed out successfully');
    } catch (e) {
      print('Sign out error: $e');
    }
  }
}

