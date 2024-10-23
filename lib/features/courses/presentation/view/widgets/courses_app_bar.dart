import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/widgets/cached_profile_photo.dart';

class CoursesAppBar extends StatelessWidget {
  const CoursesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Course',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        CachedProfilePhoto(
          hight: 50,
          width: 50,
          radius: 45.r,
        ),
      ],
    );
  }
}
