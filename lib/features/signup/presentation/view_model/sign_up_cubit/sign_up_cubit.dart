import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/signup/data/repo/sign_up_repo.dart';
import 'package:learnhub/features/signup/presentation/view_model/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;
  static SignUpCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isAgree = false;
  bool isPasswordVisible = true;
  IconData passwordIcon = Icons.visibility_off;

  void changeAgree() {
    isAgree = !isAgree;
    emit(SignUpAgreeChanged());
  }

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    passwordIcon = !isPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(SignUpPasswordVisibilityChanged());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
