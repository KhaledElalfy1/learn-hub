import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/managers/shared_perference_manager.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static SharedPreferences? sharedPreferences;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  LoginCubit() : super(InitialLogin());

   Future<void> login(String email, String password) async {
     emit(LoadingLogin());
     try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Save email and display name to SharedPreferences
      SharedPreferencesManager.setEmail(email);
      _saveDisplayName();

      emit(SuccessLogin());
      // Navigate to home screen after successful login
    } on FirebaseAuthException catch (e) {
       emit(FailureLogin(failureMessage: e.toString()));
      // Handle specific Firebase exceptions with detailed messages
      // _handleAuthError(context, e);
    }
  }

  Future<void> signInWithGoogle() async {
     emit(LoadingLogin());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception("Google sign-in was canceled");
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      _saveDisplayName();
      emit(SuccessLogin());

      // context.replaceScreen(Routes.home);
    } catch (e) {
      emit(FailureLogin(failureMessage: e.toString()));
      // CustomErrorWidget.showError(context, 'Error during Google sign-in: ${e.toString()}');
    }
  }


   Future<UserCredential> signInWithFacebook() async {
     emit(LoadingLogin());
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        emit(SuccessLogin());
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

        return await _auth.signInWithCredential(facebookAuthCredential);
      } else {
        emit(FailureLogin(failureMessage: 'Facebook login failed'));
        // CustomErrorWidget.showError(context, "Facebook login failed: ${loginResult.message}");
        throw Exception('Facebook login failed');
      }
    } catch (e) {
      emit(FailureLogin(failureMessage: e.toString()));
      // CustomErrorWidget.showError(context, 'Error during Facebook login: ${e.toString()}');
      throw e;
    }
  }






  static void _saveDisplayName() {
    final String displayName = _auth.currentUser?.displayName ?? "Guest";
    SharedPreferencesManager.setName(displayName);
  }

  static void _handleAuthError(BuildContext context, FirebaseAuthException e) {
    String errorMessage;

    switch (e.code) {
      case 'user-not-found':
        errorMessage = 'No user found for that email.';
        break;
      case 'wrong-password':
        errorMessage = 'Wrong password provided for that user.';
        break;
      default:
        errorMessage = 'Authentication error: ${e.message}';
        break;
    }
    CustomTextWidget.showError(context, errorMessage);
  }

}
