import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnhub/core/managers/shared_perference_manager.dart';
import 'log_out_state.dart';


class LogOutCubit extends Cubit<LogOutState> {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  LogOutCubit() : super(LogOutInitial());
  Future<void> signOut() async {
    try {
      emit(LogOutLoading());

      User? user = _auth.currentUser;
      if (user != null) {
        for (var info in user.providerData) {
          // التحقق من طريقة تسجيل الدخول
          switch (info.providerId) {
            case 'google.com':
            // تسجيل الخروج من Google
            SharedPreferencesManager.preferences.clear();
              await GoogleSignIn().signOut();
              log("LogOut From Google Success");
              break;
            case 'facebook.com':
            // تسجيل الخروج من Facebook
              SharedPreferencesManager.preferences.clear();
              await FacebookAuth.instance.logOut();
              log("LogOut From Facebook Success");
              break;
            case 'password':
            // تسجيل الخروج من FirebaseAuth (البريد الإلكتروني وكلمة المرور)
              SharedPreferencesManager.preferences.clear();
              await FirebaseAuth.instance.signOut();
              log("LogOut From firebase Success");
              break;
            default:
            // تسجيل الخروج الافتراضي
              SharedPreferencesManager.preferences.clear();
              await FirebaseAuth.instance.signOut();
          }
        }
      }

      emit(LogOutSuccess());
      // إعادة توجيه المستخدم إلى شاشة تسجيل الدخول
      // context.replaceScreen(Routes.login);

    } catch (e) {
      emit(LogOutFailure(failureMessage: 'Error during logout: ${e.toString()}'));
      // CustomErrorWidget.showError(context, 'Error during logout: ${e.toString()}');
    }
  }



}
