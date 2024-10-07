import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';
import 'package:learnhub/core/widgets/custom_primary_elevated_btn.dart';

import '../../../../core/managers/size_manager.dart';

class LoginSection extends StatelessWidget {
  LoginSection({super.key});

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
          ),
          SizeManager.s24.verticalSpace,
          CustomTextFormField(
            controller: passwordController,
            labelText: 'Password',
            textType: TextInputType.visiblePassword,
          ),
          SizeManager.s12.verticalSpace,

          Text(
            'Forget password?',
            style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
          ),
          SizeManager.s12.verticalSpace,

          CustomPrimaryElevatedBtn(
            onPressed: () {},
            buttonTxt: 'Log In',
            btnWidth: 1.sw,
            btnHeight: 50.h,
          )
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.labelText,
      this.suffixIcon,
      required this.controller,
      this.isSecret = false,
      required this.textType});

  TextEditingController controller;

  final String labelText;
  final Widget? suffixIcon;
  final bool isSecret;
  final TextInputType textType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorManager.lightGrey,
      keyboardType: textType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorManager.lighterGrey,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorManager.lighterGrey,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorManager.lighterGrey,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorManager.lighterGrey,
            )),
      ),
    );
  }
}
