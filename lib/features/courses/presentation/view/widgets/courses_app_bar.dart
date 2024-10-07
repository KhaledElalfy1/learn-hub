import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SvgPicture.asset(
          'assets/svg/profile.svg',
        ),
      ],
    );
  }
}
