import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/features/course_details/presentation/cubit/play_video_cubit.dart';

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
          top: SizeManager.s20.h,
          left: SizeManager.s16.w,
          right: SizeManager.s16.w,
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
            style: StyleManager.titlePoppins(color: ColorManager.darkBlue,fontSize: 22),
          ),
          Text(
            'Course description',
            style: StyleManager.descriptionPoppins(
                color: ColorManager.darkGrey, fontSize: SizeManager.s12.sp),
          ),
          Expanded(child: ListView.builder(
              padding: EdgeInsets.only(top: SizeManager.s16.h,),
              itemBuilder: (context,index)=>
              GestureDetector(
                onTap: (){
                },
                  child: LessonItem(numOfLesson: lessonOfData[index].numberOfLesson, lessonName: lessonOfData[index].lessonName, lessonTime: lessonOfData[index].lessonTime,)),itemCount: lessonOfData.length,
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
            style: StyleManager.titlePoppins(color: ColorManager.darkBlue,fontSize: 25),
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
          style: StyleManager.titlePoppins(color: ColorManager.blue,fontSize: 25),
        )
      ],
    );
  }
}

