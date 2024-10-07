import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/core/managers/size_manager.dart';

import '../../../../core/managers/asset_manager.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/style_manager.dart';

class SignupSection extends StatelessWidget {
  const SignupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? ",style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
            Text("Sign up",style: StyleManager.descriptionPoppins(color: ColorManager.blue),),
          ],
        ),
        SizeManager.s16.verticalSpace,
        Stack(
          alignment: Alignment.center,
          children: [
            Divider(
              color: ColorManager.darkGrey,

            ),
            Container(
    padding: EdgeInsets.symmetric(horizontal: SizeManager.s16.w),
    color: Colors.white,
    child: Text("or login with",style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),)
          ],
        ),
        SizeManager.s16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(SvgAssets.google),
            SvgPicture.asset(SvgAssets.facebook),

          ],
        )
      ],
    );
  }
}
