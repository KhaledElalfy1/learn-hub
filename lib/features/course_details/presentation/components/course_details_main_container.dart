import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/style_manager.dart';
import 'lesson_item.dart';

class CourseDetailsMainContainer extends StatelessWidget {
  const CourseDetailsMainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: 1.sw,
      padding: EdgeInsets.only(
          top: SizeManager.s24.h,
          left: SizeManager.s16.w,
          right: SizeManager.s16.w,
        bottom: 110.h,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(SizeManager.s24.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CourseInfoHeader(),
          SizeManager.s16.verticalSpace,
          Text(
            'About Course',
            style: StyleManager.titlePoppins(color: ColorManager.darkBlue),
          ),
          Text(
            'Course description',
            style: StyleManager.descriptionPoppins(
                color: ColorManager.darkGrey, fontSize: SizeManager.s12.sp),
          ),
          Expanded(child: ListView.builder(
              padding: EdgeInsets.only(top: SizeManager.s16.h,),
              itemBuilder: (context,index)=>

              const LessonItem(),itemCount: 10,
          )),
        ],
      ),
    ));
  }
}

class CourseInfoHeader extends StatelessWidget {
  const CourseInfoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Course Details',
            style: StyleManager.titlePoppins(color: ColorManager.darkBlue),
          ),
          Text(
            'Course description',
            style: StyleManager.descriptionPoppins(
                color: ColorManager.darkGrey,
                fontSize: SizeManager.s12.sp),
          ),
        ]),
        Text(
          '\$250.00',
          style: StyleManager.titlePoppins(color: ColorManager.blue),
        )
      ],
    );
  }
}

