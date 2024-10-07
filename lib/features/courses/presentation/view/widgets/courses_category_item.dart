import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoursesCategoryItem extends StatelessWidget {
  const CoursesCategoryItem({super.key, required this.backgroundColor, required this.imagePath, required this.title, required this.titleColor});
  final Color backgroundColor;
  final String imagePath;
  final String title;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180.w,
          height: 160.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        Positioned(
          top: -20,
          child: SvgPicture.asset(
            imagePath,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: titleColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
            ),
            child:  Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
