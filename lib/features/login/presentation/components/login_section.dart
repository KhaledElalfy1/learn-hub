import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:learnhub/core/widgets/custom_primary_elevated_btn.dart';
import 'package:learnhub/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/string_manager.dart';
import '../../../../core/utils/auth.dart';
import '../../../../core/widgets/custom_text_button.dart';

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
            labelText: StringManager.yourEmail,
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
            labelText:  StringManager.password,
            textType: TextInputType.visiblePassword,
            validator: (input){
              if(input!.isEmpty){
                return "fill your password";
              }
              return null;
            },
          ),
          SizeManager.s12.verticalSpace,

           CustomTextButton(text: StringManager.forgetPassword, onTap:(){
          },),
          SizeManager.s12.verticalSpace,

          CustomPrimaryElevatedBtn(
            onPressed: () {
              if(formKey.currentState!.validate()){
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  BlocProvider.of<LoginCubit>(context).login(email, password);
              }
            },
            buttonTxt: StringManager.logIn,
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
      required this.textType, required this.validator});

  TextEditingController controller;

  final String labelText;
  final Widget? suffixIcon;
  final bool isSecret;
  final TextInputType textType;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: ColorManager.lightGrey,
      keyboardType: textType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
        suffixIcon: suffixIcon,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorManager.lighterGrey,
            )),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorManager.lighterGrey,
            )),
        disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorManager.lighterGrey,
            )),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorManager.lighterGrey,
            )),
      ),
    );
  }
}
