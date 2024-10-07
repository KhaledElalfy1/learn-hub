import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';

import '../../../../core/managers/size_manager.dart';
import 'custom_progress_bar.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: SizeManager.s16.w),
      padding: EdgeInsets.symmetric(
          horizontal: SizeManager.s16.w, vertical: SizeManager.s20.h),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(SizeManager.s20.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lighterGrey.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Learned Today',
            style:
                StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
          ),
          RichText(
              text: TextSpan(
                  text: '46min',
                  style:
                      StyleManager.titlePoppins(color: ColorManager.darkBlue),
                  children: [
                TextSpan(
                    text: ' / 60min',
                    style: StyleManager.descriptionPoppins(
                        color: ColorManager.lightGrey))
              ])),
           CustomProgressBar(
            barColor: [

              ColorManager.lighterGreyy,
              ColorManager.orange], width: 0.5* (1.sw-64.w),
          )
        ],
      ),
    );
  }
}
