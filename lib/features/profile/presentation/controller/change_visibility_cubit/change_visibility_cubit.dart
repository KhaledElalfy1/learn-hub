import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/change_visibility_cubit/change_visibility_state.dart';

class ChangeVisibilityCubit extends Cubit<ChangeVisibilityState> {
  ChangeVisibilityCubit() : super(ChangeVisibilityInitial());
  static ChangeVisibilityCubit get(context) => BlocProvider.of(context);
  bool isOldPasswordVisible = true;
  bool isNewPasswordVisible = true;
  Icon oldPasswordVisibility = const Icon(Icons.visibility_off);
  Icon newPasswordVisibility = const Icon(Icons.visibility_off);
  void changeOldPasswordVisibility() {
    isOldPasswordVisible = !isOldPasswordVisible;
    oldPasswordVisibility = isOldPasswordVisible
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
    emit(ChangeOldPasswordVisibility());
  }

  void changeNewPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
    newPasswordVisibility = isNewPasswordVisible
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
    emit(ChangeNewPasswordVisibility());
  }
}
