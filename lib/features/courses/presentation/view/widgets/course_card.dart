import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:shimmer/shimmer.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
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
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: course.url,
              progressIndicatorBuilder: (context, url, progress) =>
                  Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[200]!,
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  color: const Color(0xffC4C4C4),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.title,
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
                    course.instructor,
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
                    '\$ ${course.price}',
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
                      '${course.duration} hours',
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
