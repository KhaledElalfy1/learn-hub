import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/core/utils/auth.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:learnhub/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/managers/asset_manager.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/string_manager.dart';
import '../../../../core/managers/style_manager.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class SignupSection extends StatelessWidget {
  const SignupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringManager.dontHaveAccount,
              style:
                  StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
            ),
            InkWell(
                onTap: () {
                  context.replaceScreen(Routes.register);
                },
                child: Text(
                  StringManager.signUp,
                  style:
                      StyleManager.descriptionPoppins(color: ColorManager.blue),
                )),
          ],
        ),
        SizeManager.s16.verticalSpace,
        Stack(
          alignment: Alignment.center,
          children: [
            const Divider(
              color: ColorManager.darkGrey,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: SizeManager.s16.w),
              color: Colors.white,
              child: Text(
                StringManager.orLoginWith,
                style: StyleManager.descriptionPoppins(
                    color: ColorManager.darkGrey),
              ),
            )
          ],
        ),
        SizeManager.s16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconButton(
              svgAssets: SvgAssets.google,
              onTap: ()async{
                print("---");
                BlocProvider.of<LoginCubit>(context).signInWithGoogle();
                print("-+++-");
              },
            ),
            CustomIconButton(
              svgAssets: SvgAssets.facebook,
              onTap: ()async {
                print("face");
                BlocProvider.of<LoginCubit>(context).signInWithFacebook();
                print("0000");
              },
            ),
          ],
        )
      ],
    );
  }
}
