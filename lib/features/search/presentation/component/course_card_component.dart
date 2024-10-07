import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {super.key,
      required this.courseTitle,
      required this.courseAuthor,
      required this.coursePrice,
      required this.courseDuration});
  final String courseTitle;
  final String courseAuthor;
  final String coursePrice;
  final String courseDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      margin: EdgeInsets.only(top: 0.02.sh,right: 0.05.sw,left: 0.05.sw),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lightGrey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            color: const Color(0xffC4C4C4),
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  const Icon(Icons.person, color: ColorManager.lighterGrey),
                  Text(
                    courseAuthor,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColorManager.lighterGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Text(
                    coursePrice,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.blue,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: ColorManager.lightPink,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '$courseDuration hours',
                      style: const TextStyle(
                        fontSize: 10,
                        color: ColorManager.lightOrange,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
