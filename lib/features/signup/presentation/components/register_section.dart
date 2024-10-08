import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/features/signup/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:learnhub/features/signup/presentation/view_model/sign_up_cubit/sign_up_state.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/style_manager.dart';
import '../../../../core/widgets/custom_primary_elevated_btn.dart';
import '../../../login/presentation/components/login_section.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignUpCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextFormField(
            controller: SignUpCubit.get(context).emailController,
            labelText: 'Your Email',
            textType: TextInputType.emailAddress,
            validator: (input) {
              if (input!.isEmpty) {
                return "fill your email";
              }
              return null;
            },
          ),
          SizeManager.s24.verticalSpace,
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) => CustomTextFormField(
              controller: SignUpCubit.get(context).passwordController,
              labelText: 'Password',
              textType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                onPressed: SignUpCubit.get(context).changePasswordVisibility,
                icon: Icon(SignUpCubit.get(context).passwordIcon),
                color: ColorManager.darkGrey,
              ),
              isSecret: SignUpCubit.get(context).isPasswordVisible,
              validator: (input) {
                if (input!.isEmpty) {
                  return "fill your email";
                }
                return null;
              },
            ),
          ),
          SizeManager.s12.verticalSpace,
          Text(
            'Forget password?',
            style:
                StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
          ),
          SizeManager.s12.verticalSpace,
          CustomPrimaryElevatedBtn(
            onPressed: () {
              if (SignUpCubit.get(context).formKey.currentState!.validate() &&
                  SignUpCubit.get(context).isAgree) {
                log("validate");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please agree to the terms and conditions"),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            buttonTxt: 'Create account',
            btnWidth: 1.sw,
            btnHeight: 50.h,
          )
        ],
      ),
    );
  }
}
