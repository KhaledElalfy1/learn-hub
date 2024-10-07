
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/size_manager.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/style_manager.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, this.description});
final String title;
final String? description;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1.sw,
      height: 0.2.sh,
      padding: EdgeInsets.only(left: SizeManager.s20.w,bottom: SizeManager.s32.h),
   alignment: Alignment.bottomLeft,
    child: description != null ?Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: StyleManager.titlePoppins(color: ColorManager.darkBlue),),
      Text(description!,style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
      ],
    ):Text(title,style: StyleManager.titlePoppins(color: ColorManager.darkBlue),),
    );
  }
}
