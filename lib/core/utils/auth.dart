import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../managers/shared_perference_manager.dart';
import '../navigation/routes.dart';

class AppAuth{
 static FirebaseAuth auth = FirebaseAuth.instance;
 static SharedPreferences? sharedPreferences;

 static Future login(String email, String password,BuildContext context)async{
  try {
   await auth.signInWithEmailAndPassword(
    email: email,
    password: password,
   );
   SharedPreferencesManager.setEmail(email);
   context.replaceScreen(Routes.home);
  } on FirebaseAuthException catch (e) {
   // Handle the error
   if (e.code == 'user-not-found') {
    print('No user found for that email.');
   } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
   } else {
    print('Error: ${e.message}');
   }
   return null;  // Return null if login fails
  }
  }

 static Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
   accessToken: googleAuth?.accessToken,
   idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
 }


 static Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
 }
}