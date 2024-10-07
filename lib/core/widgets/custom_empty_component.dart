import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';
import 'package:learnhub/core/widgets/custom_primary_elevated_btn.dart';

class CustomEmptyComponent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const CustomEmptyComponent(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath),
          Padding(
            padding: EdgeInsets.only(
                top: SizeManager.s20.sp, bottom: SizeManager.s8.sp),
            child: Text(
              title,
              style: StyleManager.mediumPoppins(color: ColorManager.darkBlue),
            ),
          ),
          Text(
            description,
            style:
                StyleManager.descriptionPoppins(color: ColorManager.darkBlue),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeManager.s8.sp),
            child: CustomPrimaryElevatedBtn(
                onPressed: () {}, buttonTxt: 'Try again', btnWidth: 240),
          )
        ],
      ),
    );
  }
}
