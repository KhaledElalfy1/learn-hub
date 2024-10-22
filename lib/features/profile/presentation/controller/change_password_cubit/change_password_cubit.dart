import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/change_password_cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    return super.close();
  }

  String? validateTextFiled(String? value) {
    if (value!.isEmpty) {
      return 'Filed required';
    }
    if (value.length < 8) {
      return 'password Short';
    }
    if (oldPasswordController.text == newPasswordController.text) {
      return 'Password is the same';
    }

    return null;
  }

  void reauthenticateAndChangePassword() {
    final user = FirebaseAuth.instance.currentUser!;
    final cred = EmailAuthProvider.credential(
        email: user.email!, password: oldPasswordController.text);
    user
        .reauthenticateWithCredential(cred)
        .then((value) => _changePassword())
        .catchError(
      (e) {
        emit(ChangePasswordFailure(eMessage:'Wrong password' ));
        debugPrint(e.toString());
      },
    );
  }

  void _changePassword() async {
    emit(ChangePasswordLoading());

    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(newPasswordController.text);
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure(eMessage:'unexpected Error'));
      debugPrint(e.toString());
    }
  }
}
