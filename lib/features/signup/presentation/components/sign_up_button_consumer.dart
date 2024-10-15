


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/navigation/routes.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:learnhub/core/widgets/custom_primary_elevated_btn.dart';
import 'package:learnhub/features/signup/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:learnhub/features/signup/presentation/view_model/sign_up_cubit/sign_up_state.dart';


class SignUpButtonConsumer extends StatelessWidget {
  const SignUpButtonConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpError) {
          log("failed to sign up message: ${state.message}"); 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: const Duration(seconds: 3),
            ),
          );
        }
        if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: const Duration(seconds: 3),
            ),
          );
          context.replaceScreen(Routes.login);
        }
      },
      builder: (context, state) {
        return state is SignUpLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomPrimaryElevatedBtn(
                onPressed: () {
                  if (SignUpCubit.get(context)
                          .formKey
                          .currentState!
                          .validate() &&
                      SignUpCubit.get(context).isAgree) {
                    SignUpCubit.get(context).signUp();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "Please agree to the terms and conditions"),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                buttonTxt: 'Create account',
                btnWidth: 1.sw,
                btnHeight: 50.h,
              );
      },
    );
  }
}
