import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:learnhub/features/login/presentation/components/login_section.dart';
import 'package:learnhub/features/profile/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/change_visibility_cubit/change_visibility_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/change_visibility_cubit/change_visibility_state.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ChangePasswordCubit.get(context).formKey,
      child: Column(
        children: [
          BlocBuilder<ChangeVisibilityCubit, ChangeVisibilityState>(
            builder: (context, state) {
              return CustomTextFormField(
                textType:  TextInputType.visiblePassword,
                isSecret:
                    ChangeVisibilityCubit.get(context).isOldPasswordVisible,
                suffixIcon: IconButton(
                    onPressed: ChangeVisibilityCubit.get(context)
                        .changeOldPasswordVisibility,
                    icon: ChangeVisibilityCubit.get(context)
                        .oldPasswordVisibility),
                validator: (p0) =>
                    ChangePasswordCubit.get(context).validateTextFiled(p0),
                controller:
                    ChangePasswordCubit.get(context).oldPasswordController,
                labelText: 'Old Password',
              );
            },
          ),
          Gap(10.h),
         const Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Enter your new password below',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
               
              ),
            ),
          ),
          Gap(10.h),
         BlocBuilder<ChangeVisibilityCubit, ChangeVisibilityState>(
            builder: (context, state) {
              return CustomTextFormField(
                textType: TextInputType.visiblePassword,
                isSecret:
                    ChangeVisibilityCubit.get(context).isNewPasswordVisible,
                suffixIcon: IconButton(
                    onPressed: ChangeVisibilityCubit.get(context)
                        .changeNewPasswordVisibility,
                    icon: ChangeVisibilityCubit.get(context)
                        .newPasswordVisibility),
                validator: (p0) =>
                    ChangePasswordCubit.get(context).validateTextFiled(p0),
                controller:
                    ChangePasswordCubit.get(context).newPasswordController,
                labelText: 'New Password',
              );
            },
          ),
        ],
      ),
    );
  }
}
