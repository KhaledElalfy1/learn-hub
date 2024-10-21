import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/forget-password/presentation/view_model/cubit/reset_pass_cubit.dart';
import 'widgets/forget_pass_body.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPassCubit(FirebaseAuth.instance),
      child: const SafeArea(
          child: Scaffold(
        body: ForgetPassBody(),
      )),
    );
  }
}
