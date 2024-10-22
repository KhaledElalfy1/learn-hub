import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:learnhub/features/profile/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/change_password_cubit/change_password_state.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/change_password_form.dart';
import 'package:quickalert/quickalert.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Change Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
            const Divider(
              thickness: 2,
            ),
            Gap(10.h),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Enter your new password below',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Gap(10.h),
            const ChangePasswordForm(),
            Gap(25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ))),
                ElevatedButton(
                  onPressed: () {
                    if (ChangePasswordCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      FocusScope.of(context).unfocus();
                      ChangePasswordCubit.get(context)
                          .reauthenticateAndChangePassword();
                    }
                  },
                  child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                    listener: (context, state) {
                      if (state is ChangePasswordSuccess) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: 'Success',
                          text: 'Password changed successfully',
                        );
                      } else if (state is ChangePasswordFailure) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Error',
                          text: state.eMessage,
                        );
                        ;
                      }
                    },
                    builder: (context, state) {
                      return state is ChangePasswordLoading
                          ? const Center(child: CircularProgressIndicator())
                          : const Text(
                              'Edit',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
