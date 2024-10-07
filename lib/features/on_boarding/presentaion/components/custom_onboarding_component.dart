import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';

class CustomOnboardingComponent extends StatelessWidget {
  final String imagePath;
  final String titleTxt;
  final String descriptionTxt;
  const CustomOnboardingComponent({
    super.key,
    required this.imagePath,
    required this.titleTxt,
    required this.descriptionTxt,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      Container(
          decoration: BoxDecoration(
              color: ColorManager.lightBlue,
              borderRadius: BorderRadius.circular(SizeManager.s64.sp)),
          child: SvgPicture.asset(imagePath)),

      Padding(
        padding:
            EdgeInsets.only(top: SizeManager.s20.sp, bottom: SizeManager.s8.sp),
        child: Text(
          titleTxt,
          style: StyleManager.titlePoppins(color: ColorManager.darkBlue),
        ),
      ),

      Text(
        descriptionTxt,
        style: StyleManager.descriptionPoppins(color: ColorManager.darkBlue),
      ),
      
    ]);
  }
}
