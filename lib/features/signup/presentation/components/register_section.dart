import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/style_manager.dart';
import '../../../../core/widgets/custom_primary_elevated_btn.dart';
import '../../../login/presentation/components/login_section.dart';

class RegisterSection extends StatelessWidget {
   RegisterSection({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextFormField(
            controller: emailController,
            labelText: 'Your Email',
            textType: TextInputType.emailAddress,
            validator: (input){
              if(input!.isEmpty){
                return "fill your email";
              }
              return null;
            },
          ),
          SizeManager.s24.verticalSpace,
          CustomTextFormField(
            controller: passwordController,
            labelText: 'Password',
            textType: TextInputType.visiblePassword,
            validator: (input){
              if(input!.isEmpty){
                return "fill your email";
              }
              return null;
            },
          ),
          SizeManager.s12.verticalSpace,

          Text(
            'Forget password?',
            style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
          ),
          SizeManager.s12.verticalSpace,

          CustomPrimaryElevatedBtn(
            onPressed: () {
              if(formKey.currentState!.validate()){
                print("validate");
              }
              else{
                print("Invalidate");
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
