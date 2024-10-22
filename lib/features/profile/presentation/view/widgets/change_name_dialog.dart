import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:learnhub/features/login/presentation/components/login_section.dart';
import 'package:learnhub/features/profile/presentation/controller/change_account_name_cubit/change_account_name_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/change_account_name_cubit/change_account_name_state.dart';

class ChangeNameDialog extends StatelessWidget {
  const ChangeNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           const Text(
             'change Name',
              style:TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal,)
               
            ),
            Gap(10.h),
            const Divider(
              color: Colors.grey,
              thickness: 1.5,
            ),
            Gap(16.h),
            Form(
              key: ChangeAccountNameCubit.get(context).globalKey,
              child: CustomTextFormField(
                textType: TextInputType.text,
                validator: (p0) =>
                    ChangeAccountNameCubit.get(context).validator(p0, context),
                controller:
                    ChangeAccountNameCubit.get(context).nameController,
               labelText :'User Name',
              ),
            ),
            Gap(28.h),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:const Text(
                     'cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )
                      
                    ),
                  ),
                ),
                Expanded(
                  child: BlocConsumer<ChangeAccountNameCubit,
                      ChangeAccountNameState>(
                    listener: (context, state) {
                      if (state is ChangeAccountNameSuccess) {
                        Navigator.pop(context, 1);
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: ChangeAccountNameCubit.get(context)
                            .changeAccountName,
                        child: state is ChangeAccountNameLoading
                            ?const Center(child:   CircularProgressIndicator())
                            : Text(
                                'Edit',
                                style:TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,)
                                 
                              ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
