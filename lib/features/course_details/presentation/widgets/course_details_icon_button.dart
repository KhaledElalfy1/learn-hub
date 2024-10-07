import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';

import '../../../../core/managers/size_manager.dart';

class CourseDetailsIconButton extends StatelessWidget {
  const CourseDetailsIconButton({super.key, required this.onTap});
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 89.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: ColorManager.lightPink,
          borderRadius: BorderRadius.all(Radius.circular(SizeManager.s8.r)),

        ),
        child: const Icon(CupertinoIcons.star, color: ColorManager.orange,),
      ),
    );
  }
}
