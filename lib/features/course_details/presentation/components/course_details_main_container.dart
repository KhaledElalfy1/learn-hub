import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/style_manager.dart';
import 'lesson_item.dart';

class CourseDetailsMainContainer extends StatelessWidget {
  const CourseDetailsMainContainer({super.key, required this.courseModel});
  final CourseModel courseModel;
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
          CourseInfoHeader(
            courseModel: courseModel,
          ),
          SizeManager.s16.verticalSpace,
          Text(
            'About Course',
            style: StyleManager.titlePoppins(
                color: ColorManager.darkBlue, fontSize: 22),
          ),
          Text(
            courseModel.description,
            style: StyleManager.descriptionPoppins(
                color: ColorManager.darkGrey, fontSize: SizeManager.s12.sp),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.only(
              top: SizeManager.s16.h,
            ),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: LessonItem(
                  numOfLesson: lessonOfData[index].numberOfLesson,
                  lessonName: lessonOfData[index].lessonName,
                  lessonTime: lessonOfData[index].lessonTime,
                )),
            itemCount: lessonOfData.length,
          )),
        ],
      ),
    ));
  }
}

class CourseInfoHeader extends StatelessWidget {
  const CourseInfoHeader({
    super.key,
    required this.courseModel,
  });
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            courseModel.title,
            style: StyleManager.titlePoppins(
                color: ColorManager.darkBlue, fontSize: 25),
          ),
          Text(
            "${courseModel.duration} . ${courseModel.instructor}",
            style: StyleManager.descriptionPoppins(
                color: ColorManager.darkGrey, fontSize: SizeManager.s12.sp),
          ),
        ]),
        Text(
          '\$${courseModel.price}',
          style:
              StyleManager.titlePoppins(color: ColorManager.blue, fontSize: 25),
        )
      ],
    );
  }
}
