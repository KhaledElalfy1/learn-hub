// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:learnhub/core/utils/extensions.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../managers/shared_perference_manager.dart';
// import '../navigation/routes.dart';
// import '../widgets/custom_error_widget.dart';
//
// class AppAuth {
//  // Initialize Firebase Auth and Google SignIn instances
//  static final FirebaseAuth _auth = FirebaseAuth.instance;
//  static SharedPreferences? sharedPreferences;
//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//  /// Method to handle email/password login
//  static Future<void> login(String email, String password, BuildContext context) async {
//   try {
//    await _auth.signInWithEmailAndPassword(email: email, password: password);
//
//    // Save email and display name to SharedPreferences
//    SharedPreferencesManager.setEmail(email);
//    _saveDisplayName();
//
//    // Navigate to home screen after successful login
//    context.replaceScreen(Routes.home);
//   } on FirebaseAuthException catch (e) {
//    // Handle specific Firebase exceptions with detailed messages
//    _handleAuthError(context, e);
//   }
//  }
//
//  /// Google Sign-In flow
//  Future<void> signInWithGoogle(BuildContext context) async {
//   try {
//    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//    if (googleUser == null) {
//     throw Exception("Google sign-in was canceled");
//    }
//
//    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//    final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//    );
//
//    await _auth.signInWithCredential(credential);
//    _saveDisplayName();
//
//    context.replaceScreen(Routes.home);
//   } catch (e) {
//    CustomErrorWidget.showError(context, 'Error during Google sign-in: ${e.toString()}');
//   }
//  }
//
//  /// Facebook Sign-In flow
//  static Future<UserCredential> signInWithFacebook(BuildContext context) async {
//   try {
//    final LoginResult loginResult = await FacebookAuth.instance.login();
//    if (loginResult.status == LoginStatus.success) {
//     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
//
//     return await _auth.signInWithCredential(facebookAuthCredential);
//    } else {
//     CustomErrorWidget.showError(context, "Facebook login failed: ${loginResult.message}");
//     throw Exception('Facebook login failed');
//    }
//   } catch (e) {
//    CustomErrorWidget.showError(context, 'Error during Facebook login: ${e.toString()}');
//    throw e;
//   }
//  }
//
//  /// Logout from all auth providers
//  static Future<void> signOut() async {
//   await _auth.signOut();
//   await GoogleSignIn().signOut();
//   await FacebookAuth.instance.logOut();
//  }
//
//  /// Save the display name in SharedPreferences, with a fallback to "Guest"
//  static void _saveDisplayName() {
//   final String displayName = _auth.currentUser?.displayName ?? "Guest";
//   SharedPreferencesManager.setName(displayName);
//  }
//
//  /// Handle Firebase authentication errors
//  static void _handleAuthError(BuildContext context, FirebaseAuthException e) {
//   String errorMessage;
//
//   switch (e.code) {
//    case 'user-not-found':
//     errorMessage = 'No user found for that email.';
//     break;
//    case 'wrong-password':
//     errorMessage = 'Wrong password provided for that user.';
//     break;
//    default:
//     errorMessage = 'Authentication error: ${e.message}';
//     break;
//   }
//   CustomErrorWidget.showError(context, errorMessage);
//  }
// }
